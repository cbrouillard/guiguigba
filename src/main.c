
#include <hel2.h>
#include "gfx/ResourceData.h"

// Prototypes
void app_init();
void app_showImgBackground();
void app_writeSomeText(char* text);

int main(){

  app_init();
  app_showImgBackground();

  app_writeSomeText ("coucou guigui");

  for (;;) {

        hel_PadCapture();

        if (hel_PadQuery()->Pressed.Start ||
                hel_PadQuery()->Pressed.Select ||
                hel_PadQuery()->Pressed.A ||
                hel_PadQuery()->Pressed.B ||
                hel_PadQuery()->Pressed.Up ||
                hel_PadQuery()->Pressed.Down ||
                hel_PadQuery()->Pressed.Right ||
                hel_PadQuery()->Pressed.Left ||
                hel_PadQuery()->Pressed.R ||
                hel_PadQuery()->Pressed.L
                ) {
            break;
        }

        // Wait for Vertical Blank
        hel_SwiVBlankIntrWait();
    }

  return 0;

}

// Implémentations des prototypes et fonctions utilitaires

// Procédure pour l'interruption système de synchro.
void VBLInterruptHandler(void) {
    hel_ObjTransmit();
    // acknowledge interrupt
    hel_IntrAcknowledge(INT_TYPE_VBL);
}

// app_init
// Initialise la stack système
// Initialise la palette principale
// Initialise le moteur de rendu de texte
#define TEXT_LAYER 1
#define SCREEN_LAYER 3


u8 ATTR_EWRAM ATTR_ALIGNED(4) g_BgTextSystemMemory[HEL_SUBSYSTEM_BGTEXT_REQUIREDMEMORY];
u16 ATTR_EWRAM g_CharLUT[256];
// attention, table ASCII uniquement sinon ça fout la grouille.
const unsigned char CHARORDER[] =
        " BCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmn"\
    "opqrstuvwxyz0123456789,.-;:A#^+*@"\
    "!\"~$%&/()=?|\\<>[]{}¹²³°";

u8 ATTR_EWRAM ATTR_ALIGNED(4) g_ObjSystemBuffer[HEL_SUBSYSTEM_OBJ_REQUIREDMEMORY];

// Reserve memory for the Map-System. This buffer
// is used to manage internal states of the Map-System.
// You can achieve a little performance increase when you
// store it in IWRAM, but keep in mind, IWRAM is very limited!
// The recommended memory location is EWRAM.
u8 ATTR_EWRAM ATTR_ALIGNED(4) g_MapSystemBuffer[HEL_SUBSYSTEM_MAP_REQUIREDMEMORY];

void app_init() {
    // HAM !
    ham_Init();
    hel_SysSetPrefetch(FALSE);

    hel_BgSetMode(0);
    
    hel_MapInit(g_MapSystemBuffer);
    hel_BgTextInit((void*) g_BgTextSystemMemory);
    hel_ObjInit(g_ObjSystemBuffer);

    hel_PadInit();
    hel_PadSetRepeatDelay(PAD_BUTTON_R | PAD_BUTTON_L | PAD_BUTTON_LEFT | PAD_BUTTON_RIGHT | PAD_BUTTON_UP | PAD_BUTTON_DOWN | PAD_BUTTON_A | PAD_BUTTON_B | PAD_BUTTON_START, 1);
    hel_PadSetRepeatRate(PAD_BUTTON_LEFT | PAD_BUTTON_RIGHT | PAD_BUTTON_UP | PAD_BUTTON_DOWN, 10);
    hel_PadSetRepeatRate(PAD_BUTTON_R | PAD_BUTTON_L | PAD_BUTTON_A | PAD_BUTTON_B | PAD_BUTTON_START, 0);

    // initialisation des palettes.
    hel_PalBgLoad256(ResData16(RES_SCREEN_PAL));
    
    // Initialize the tileset and an empty
    ham_bg[TEXT_LAYER].ti = ham_InitTileSet((void*) ResData(RES_TEXT_RAW), RES_TEXT_RAW_SIZE16, 1, 1);
    ham_bg[TEXT_LAYER].mi = ham_InitMapEmptySet((u8) 640, 0);

    hel_BgTextCreate(
            TEXT_LAYER, // BgNo
            1, // Width of one character specified in tiles
            1, // Height of one character specified in tiles
            //ResData(RES_CHARSET8X8_MAP), // Pointer to character map
            ResData(RES_TEXT_MAP),
            CHARORDER, // Pointer to array that reflects the order of characters on source graphic
            g_CharLUT, // Pointer to buffer that receives the generated lookup table
            BGTEXT_FLAGS_GENERATELUT); // Flags that control creation and print behaviour

    ham_InitBg(TEXT_LAYER, TRUE, 0, FALSE);

    hel_IntrStartHandler(INT_TYPE_VBL, (void*) &VBLInterruptHandler);
}


void app_showImgBackground() {

    ham_bg[SCREEN_LAYER].ti = ham_InitTileSet((void*)ResData(RES_IMGBACKGROUND_RAW), RES_IMGBACKGROUND_RAW_SIZE16, 1, 1);
    // Create a map for background
    hel_MapCreate(SCREEN_LAYER,        // Background number
                  32,   // width in tiles
                  20,   // height in tiles
                  ResData(RES_IMGBACKGROUND_MAP),   // Pointer to source MapData
                  sizeof(u16),                  // DataTypeSize of one element from Source MapData
                  MAP_FLAGS_DEFAULT);           // Flags to control map behaviour

    ham_InitBg(SCREEN_LAYER, 1, 3, FALSE);

}


void app_writeSomeText(char* text) {
  hel_BgTextPrintF(TEXT_LAYER, 5, 13, 0, text);
}
