
#include <hel2.h>
#include "gfx/ResourceData.h"

#define TEXT_LAYER 1
#define SCREEN_LAYER 3
#define SOLPEACH 113
#define SOL 113
#define SOLTORTUE 110
#define SOLMONSTRE 110
#define MAXDROITE 220
#define XPEACH 2

// Prototypes
void app_init();
void FAT_initSpritePalette();
void app_showImgBackground();
void app_showImgGameCover();
void app_writeSomeText(char* text, u8 xTEXT, u8 yTEXT);
void hidePerso();
void showPerso();
void deplace();
void app_showFirstScreen();
void animePersonage();
void discoursChampi();
void app_showImgNiveau1();
void app_showImgNiveau2();

u8 x=2;
u8 y=70;
u8 yPeach;
u8 xPeach;
u8 jump;
bool unSurDeux = 0;
bool jumpBreak = 0;
u8 xMonstre = 30;
bool level1complete = 0;
u8 nbMontres = 0;

int main(){

  app_init();
  initPeach();
  initChamp1();
  initTortue();
  initMonstre();
  app_showFirstScreen();
  app_showImgGameCover();

//jump
  //app_showImgNiveau1();
  //discoursChampi();
  app_showImgNiveau2();

  //peach
  showPerso();
  movePeach(XPEACH,SOLPEACH);
  yPeach = SOLPEACH;
  xPeach = XPEACH;

  //champ1
  showChamp1();
  moveChamp1(100,SOL);

  //tortue
  showTortue();
  moveTortue(150,SOLTORTUE);

  //monstre
  showMonstre();
  moveMonstre(xMonstre,SOLMONSTRE);
  xMonstre = MAXDROITE;

u8 t;
u8 temporisation=0;

//Niveau 1
  for (;;) {

        hel_PadCapture();

        if (hel_PadQuery()->Pressed.Start){
          FAT_reinitScreen();
          app_writeSomeText("start",2,2);
        }
        if (hel_PadQuery()->Pressed.Select){
          FAT_reinitScreen();
          app_writeSomeText("Select",2,6);
        }
        if (hel_PadQuery()->Pressed.A){
          //FAT_reinitScreen();
          //app_writeSomeText("A",2,8);
          jump = 1;
          if(jumpBreak == 0){
            jumpPeach();
            jumpBreak = 1;
          }

        }
        if (hel_PadQuery()->Pressed.B){
          FAT_reinitScreen();
          app_writeSomeText("B",2,8);
        }
        if (hel_PadQuery()->Pressed.Up){}
        if (hel_PadQuery()->Pressed.Down){}
        if (hel_PadQuery()->Pressed.Right){
          if(xPeach>=175) {
            //discoursChampi();
          }else {
            xPeach+=4;
            movePeach(xPeach,yPeach);
          }
          //jump peach
          if (jump == 1){
            if(jumpBreak == 0){
              jumpPeach();
              jumpBreak = 1;
            }
          }
        }
        if (hel_PadQuery()->Pressed.Left){
          //FAT_reinitScreen();
          if(xPeach > 2){
            xPeach-=4;
            movePeach(xPeach,yPeach);
          }
        }
        if (hel_PadQuery()->Pressed.R){}
        if (hel_PadQuery()->Pressed.L){}

        //Avance monstre
        moveMonstre(xMonstre,SOLMONSTRE);
        xMonstre--;

        //Fait redescendre peach
        if(yPeach < SOLPEACH){
          if(unSurDeux == 0) {
            yPeach += 1;
            movePeach(xPeach,yPeach);
            unSurDeux = 1;
          }else{
            unSurDeux = 0;
          }
        }else{
          jumpBreak = 0;
        }

        //Test collision peach et monstre -> blink de peach
        if(xPeach+16 >= xMonstre && temporisation < 30){
          //clignote peach et monstre
          hidePerso();
          hel_SwiVBlankIntrWait();
          showPerso();
          temporisation++;
          app_writeSomeText("Collision",2,2);
        }

        //Fin du niveau 1
        //si on a passé tous les monstres
        nbMontres=5;
        if(nbMontres == 5){
          level1complete = 1;
          break;
        }

        // Wait for Vertical Blank
        hel_SwiVBlankIntrWait();
    }

  //texte fin de niveau 1
  FAT_reinitScreen();
  app_showImgNiveau1FIN();
  hideALL();
  for(;;){
    hel_PadCapture();
    if (hel_PadQuery()->Pressed.Start){
      break;
    }
  }

  //Niveau 2
  FAT_reinitScreen();
  hideALL();
  app_showImgNiveau2();
  app_writeSomeText("niveau 2",2,5);
  for(;;){

    hel_SwiVBlankIntrWait();
  }

  return 0;

} //fin du main

void hideALL(){
  hidePerso();
  hideChamp1();
  hideTortue();
  hideMonstre();
}

//fait sauter le perso
void jumpPeach(){
  yPeach -= 30;
  movePeach(xPeach,yPeach);
  jump = 0;
}

void discoursChampi(){
    app_writeSomeText("Bonjour Morgane, je suis ",2,4);
    app_writeSomeText("un gentil petit champi",2,5);
    app_writeSomeText("et je vais te raconter",2,6);
    app_writeSomeText("une histoire.",2,7);
    app_writeSomeText("Tu viens d'etre catapulte",2,8);
    app_writeSomeText("dans un mode magique...",2,9);
    app_writeSomeText("Le monde des geeks !",2,10);
    app_writeSomeText("Ta mission si tu l'acceptes",2,11);
    app_writeSomeText("est d'aller delivrer ton",2,12);
    app_writeSomeText("geek d'amour :)",2,13);
    app_writeSomeText("[PRESS START]",5,16);

    for(;;) {
      hel_PadCapture();
            if (hel_PadQuery()->Pressed.Start ||
                    hel_PadQuery()->Pressed.Select || hel_PadQuery()->Pressed.A ||  hel_PadQuery()->Pressed.B ||  hel_PadQuery()->Pressed.Up ||  hel_PadQuery()->Pressed.Down ||
                    hel_PadQuery()->Pressed.Right ||  hel_PadQuery()->Pressed.Left ||  hel_PadQuery()->Pressed.R ||  hel_PadQuery()->Pressed.L) {
                break;
            }
            hel_SwiVBlankIntrWait();
    }
    FAT_reinitScreen();
    app_writeSomeText("Il est actuellement prisonier",1,4);
    app_writeSomeText("dans une boucle infinie.",2,5);
    app_writeSomeText("Pour cela tu dervas eviter",2,7);
    app_writeSomeText("des pti monstres et",2,8);
    app_writeSomeText("les pluies de clefs usb.",2,9);
    app_writeSomeText("Appuie sur START pour ",2,14);
    app_writeSomeText("demarrer ta quete!",2,15);
}

void animePersonage(){
  u8 x=100;
  u8 y=70;
  for(;;) {
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
    x++;
    showPerso();
    movePeach(x,y);
    if (x >= 150) {
      x==100;
    }
    hel_SwiVBlankIntrWait();
  }
}

void app_showFirstScreen() {

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

//Gestion de Peach
/**
 * ID technique HAM pour le cursor de taille 1.
 */
THandle peach_obj;
void initPeach() {
    peach_obj = hel_ObjCreate(ResData(RES_PEACH_RAW), // Pointer to source graphic
                                                          OBJ_SHAPE_VERTICAL,       // Obj Shape
                                                          2,                      // Obj Size, 1 means 16x16 pixels, if Shape is set to SQUARE
                                                          OBJ_MODE_SEMITRANSPARENT,        // Obj Mode
                                                          COLORS_16,              // Use 16 color mode
                                                          0,                      // Palette number. Only neccessary in 16 color mode
                                                          FALSE,                  // Don't use mosaic
                                                          FALSE,                  // Don't flip the sprite horizontally
                                                          FALSE,                  // Don't flip the object vertically
                                                          1,                      // Priority against background. 0=higest
                                                          FALSE,                  // Don't make the object double-sized
                                                          100,                    // Destination horzintal screen coordinate in pixels
                                                          70                      // Destination vertical screen coordinate in pixels
                                                          );

    hel_ObjSetVisible(peach_obj, 0);
}

void hidePerso() {
  hel_ObjSetVisible(peach_obj, 0);
}

void showPerso() {
  hel_ObjSetVisible(peach_obj, 1);
}

void movePeach(u8 x, u8 y) {
    hel_ObjSetXY(peach_obj, x, y);
}

//Gestion des champi
THandle champ1_obj;
void initChamp1() {
    champ1_obj = hel_ObjCreate(ResData(RES_CHAMP1_RAW), // Pointer to source graphic
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
                                                          100,                    // Destination horzintal screen coordinate in pixels
                                                          70                      // Destination vertical screen coordinate in pixels
                                                          );

    hel_ObjSetVisible(champ1_obj, 0);
}
void hideChamp1() {
  hel_ObjSetVisible(champ1_obj, 0);
}

void showChamp1() {
  hel_ObjSetVisible(champ1_obj, 1);
}

void moveChamp1(u8 x, u8 y) {
    hel_ObjSetXY(champ1_obj, x, y);
}

//Gestion de la tortue
THandle tortue_obj;
void initTortue() {
    tortue_obj = hel_ObjCreate(ResData(RES_TORTUE_RAW), // Pointer to source graphic
                                                          OBJ_SHAPE_VERTICAL,       // Obj Shape
                                                          2,                      // Obj Size, 1 means 16x16 pixels, if Shape is set to SQUARE
                                                          OBJ_MODE_SEMITRANSPARENT,        // Obj Mode
                                                          COLORS_16,              // Use 16 color mode
                                                          0,                      // Palette number. Only neccessary in 16 color mode
                                                          FALSE,                  // Don't use mosaic
                                                          FALSE,                  // Don't flip the sprite horizontally
                                                          FALSE,                  // Don't flip the object vertically
                                                          1,                      // Priority against background. 0=higest
                                                          FALSE,                  // Don't make the object double-sized
                                                          100,                    // Destination horzintal screen coordinate in pixels
                                                          70                      // Destination vertical screen coordinate in pixels
                                                          );

    hel_ObjSetVisible(tortue_obj, 0);
}
void hideTortue() {
  hel_ObjSetVisible(tortue_obj, 0);
}

void showTortue() {
  hel_ObjSetVisible(tortue_obj, 1);
}

void moveTortue(u8 x, u8 y) {
    hel_ObjSetXY(tortue_obj, x, y);
}

//Gestion du monstre
THandle monstre_obj;
void initMonstre() {
    monstre_obj = hel_ObjCreate(ResData(RES_MONSTRE1_RAW), // Pointer to source graphic
                                                          OBJ_SHAPE_VERTICAL,       // Obj Shape
                                                          2,                      // Obj Size, 1 means 16x16 pixels, if Shape is set to SQUARE
                                                          OBJ_MODE_SEMITRANSPARENT,        // Obj Mode
                                                          COLORS_16,              // Use 16 color mode
                                                          0,                      // Palette number. Only neccessary in 16 color mode
                                                          FALSE,                  // Don't use mosaic
                                                          FALSE,                  // Don't flip the sprite horizontally
                                                          FALSE,                  // Don't flip the object vertically
                                                          1,                      // Priority against background. 0=higest
                                                          FALSE,                  // Don't make the object double-sized
                                                          100,                    // Destination horzintal screen coordinate in pixels
                                                          70                      // Destination vertical screen coordinate in pixels
                                                          );

    hel_ObjSetVisible(monstre_obj, 0);
}
void hideMonstre() {
  hel_ObjSetVisible(monstre_obj, 0);
}

void showMonstre() {
  hel_ObjSetVisible(monstre_obj, 1);
}

void moveMonstre(u8 x, u8 y) {
    hel_ObjSetXY(monstre_obj, x, y);
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
//#define TEXT_LAYER 1
//#define SCREEN_LAYER 3


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
    hel_PadSetRepeatRate(PAD_BUTTON_LEFT | PAD_BUTTON_RIGHT | PAD_BUTTON_UP | PAD_BUTTON_DOWN, 3);
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

void app_showImgGameCover() {

    ham_bg[SCREEN_LAYER].ti = ham_InitTileSet((void*)ResData(RES_IMGGAMECOVER_RAW), RES_IMGGAMECOVER_RAW_SIZE16, 1, 1);
    // Create a map for background
    hel_MapCreate(SCREEN_LAYER,        // Background number
                  32,   // width in tiles
                  20,   // height in tiles
                  ResData(RES_IMGGAMECOVER_MAP),   // Pointer to source MapData
                  sizeof(u16),                  // DataTypeSize of one element from Source MapData
                  MAP_FLAGS_DEFAULT);           // Flags to control map behaviour

    ham_InitBg(SCREEN_LAYER, 1, 3, FALSE);

}

void app_showImgIntro() {

    ham_bg[SCREEN_LAYER].ti = ham_InitTileSet((void*)ResData(RES_INTRO_RAW), RES_INTRO_RAW_SIZE16, 1, 1);
    // Create a map for background
    hel_MapCreate(SCREEN_LAYER,        // Background number
                  32,   // width in tiles
                  20,   // height in tiles
                  ResData(RES_INTRO_MAP),   // Pointer to source MapData
                  sizeof(u16),                  // DataTypeSize of one element from Source MapData
                  MAP_FLAGS_DEFAULT);           // Flags to control map behaviour

    ham_InitBg(SCREEN_LAYER, 1, 3, FALSE);

}

void app_showImgNiveau1() {

    ham_bg[SCREEN_LAYER].ti = ham_InitTileSet((void*)ResData(RES_NIV1_RAW), RES_NIV1_RAW_SIZE16, 1, 1);
    // Create a map for background
    hel_MapCreate(SCREEN_LAYER,        // Background number
                  32,   // width in tiles
                  20,   // height in tiles
                  ResData(RES_NIV1_MAP),   // Pointer to source MapData
                  sizeof(u16),                  // DataTypeSize of one element from Source MapData
                  MAP_FLAGS_DEFAULT);           // Flags to control map behaviour

    ham_InitBg(SCREEN_LAYER, 1, 3, FALSE);

}

void app_showImgNiveau1FIN() {

    ham_bg[SCREEN_LAYER].ti = ham_InitTileSet((void*)ResData(RES_NIV1FIN_RAW), RES_NIV1FIN_RAW_SIZE16, 1, 1);
    // Create a map for background
    hel_MapCreate(SCREEN_LAYER,        // Background number
                  32,   // width in tiles
                  20,   // height in tiles
                  ResData(RES_NIV1FIN_MAP),   // Pointer to source MapData
                  sizeof(u16),                  // DataTypeSize of one element from Source MapData
                  MAP_FLAGS_DEFAULT);           // Flags to control map behaviour

    ham_InitBg(SCREEN_LAYER, 1, 3, FALSE);

}

void app_showImgNiveau2() {

    ham_bg[SCREEN_LAYER].ti = ham_InitTileSet((void*)ResData(RES_NIV2_RAW), RES_NIV2_RAW_SIZE16, 1, 1);
    // Create a map for background
    hel_MapCreate(SCREEN_LAYER,        // Background number
                  32,   // width in tiles
                  20,   // height in tiles
                  ResData(RES_NIV2_MAP),   // Pointer to source MapData
                  sizeof(u16),                  // DataTypeSize of one element from Source MapData
                  MAP_FLAGS_DEFAULT);           // Flags to control map behaviour

    ham_InitBg(SCREEN_LAYER, 1, 3, FALSE);

}

void app_writeSomeText(char* text, u8 xTEXT, u8 yTEXT) {
  hel_BgTextPrintF(TEXT_LAYER, xTEXT, yTEXT, 0, text);
}
