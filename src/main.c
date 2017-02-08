
#include <hel2.h>
#include "gfx/ResourceData.h"

#define TEXT_LAYER 1
#define SCREEN_LAYER 3

// Prototypes
void app_init();
void FAT_initSpritePalette();
void app_showImgBackground();
void app_showImgBackground2();
void app_writeSomeText(char* text);
void hideCursor();
void showCursor();
void deplace();
u8 x=2;
u8 y=2;

int main(){

  app_init();
  //app_showImgBackground2();

  //app_writeSomeText ("coucou guigui");

  for (;;) {

        hel_PadCapture();
        FAT_initCursor1();

        if (hel_PadQuery()->Pressed.Start){}
        if (hel_PadQuery()->Pressed.Select){}
        if (hel_PadQuery()->Pressed.A){}
        if (hel_PadQuery()->Pressed.B){}
        if (hel_PadQuery()->Pressed.Up){}
        if (hel_PadQuery()->Pressed.Down){}
        if (hel_PadQuery()->Pressed.Right){
          x++;
          y++;
          FAT_cursors_moveCursor1(x,y);
          showCursor();
        }
        if (hel_PadQuery()->Pressed.Left){
          FAT_reinitScreen();
          hideCursor();
        }
        if (hel_PadQuery()->Pressed.R){}
        if (hel_PadQuery()->Pressed.L){}
        //break;

        // Wait for Vertical Blank
        hel_SwiVBlankIntrWait();
    }

  return 0;

}

/**
 * \brief Méthode qui permet de réinitialiser le BG SCREEN_LAYER proprement.
 *
 * <b>NE PAS TOUCHER !  </b>
 */
void FAT_reinitScreen() {
    if (ham_bg[SCREEN_LAYER].ti) {
        ham_DeInitTileSet(ham_bg[SCREEN_LAYER].ti);
        ham_DeInitMapSet(ham_bg[SCREEN_LAYER].mi);
        FAT_forceClearTextLayer();
    }
}

/**
 * \brief Méthode à réfactorer : effacer l'écran texte en affichant des espaces partout.
 *
 * Performance warning ! Afficher du texte via HAM est lent !
 */
void FAT_forceClearTextLayer() {
    if (ham_bg[TEXT_LAYER].ti) {

        ham_DeInitTileSet(ham_bg[TEXT_LAYER].ti);
        ham_DeInitMapSet(ham_bg[TEXT_LAYER].mi);

        ham_bg[TEXT_LAYER].ti = ham_InitTileSet((void*) ResData(RES_TEXT_RAW), RES_TEXT_RAW_SIZE16, 1, 1);
        ham_bg[TEXT_LAYER].mi = ham_InitMapEmptySet((u8) 1024, 0);
    }

}

/**
 * \brief La palette pour les sprites est différente: cette fonction la charge au bon endroit.
 */
void FAT_initSpritePalette() {
    hel_PalObjLoad16(ResData16(RES_SPRITES_PAL), 0);
}
/**
 * ID technique HAM pour le cursor de taille 1.
 */
THandle FAT_cursor1_obj;
void FAT_initCursor1() {
    FAT_cursor1_obj = hel_ObjCreate(ResData(RES_OSC_SAW_RAW), // Pointer to source graphic
                                                          OBJ_SHAPE_SQUARE,       // Obj Shape
                                                          1,                      // Obj Size, 1 means 16x16 pixels, if Shape is set to SQUARE
                                                          OBJ_MODE_SEMITRANSPARENT,        // Obj Mode
                                                          COLORS_16,              // Use 16 color mode
                                                          0,                      // Palette number. Only neccessary in 16 color mode
                                                          FALSE,                  // Don't use mosaic
                                                          FALSE,                  // Don't flip the sprite horizontally
                                                          FALSE,                  // Don't flip the object vertically
                                                          1,                      // Priority against background. 0=higest
                                                          FALSE,                  // Don't make the object double-sized
                                                          0,                    // Destination horzintal screen coordinate in pixels
                                                          0                      // Destination vertical screen coordinate in pixels
                                                          );

    hel_ObjSetVisible(FAT_cursor1_obj, 0);
}

void hideCursor() {
  hel_ObjSetVisible(FAT_cursor1_obj, 0);
}

void showCursor() {
  hel_ObjSetVisible(FAT_cursor1_obj, 1);
}

void FAT_cursors_moveCursor1(u8 x, u8 y) {
    hel_ObjSetXY(FAT_cursor1_obj, x, y);
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
    FAT_initSpritePalette();

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

void app_showImgBackground2() {

    ham_bg[SCREEN_LAYER].ti = ham_InitTileSet((void*)ResData(RES_IMGBACKGROUND2_RAW), RES_IMGBACKGROUND2_RAW_SIZE16, 1, 1);
    // Create a map for background
    hel_MapCreate(SCREEN_LAYER,        // Background number
                  32,   // width in tiles
                  20,   // height in tiles
                  ResData(RES_IMGBACKGROUND2_MAP),   // Pointer to source MapData
                  sizeof(u16),                  // DataTypeSize of one element from Source MapData
                  MAP_FLAGS_DEFAULT);           // Flags to control map behaviour

    ham_InitBg(SCREEN_LAYER, 1, 3, FALSE);

}

void app_writeSomeText(char* text) {
  hel_BgTextPrintF(TEXT_LAYER, 2, 2, 0, text);
}
