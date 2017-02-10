#!/bin/sh
VERSION="1.0"
echo "### Nettoyage"
make clean
find . -name "*.o" -exec rm {} \;
find . -name "*.s" -exec rm {} \;
find . -name "*.gba" -exec rm {} \;
find . -name "*.elf" -exec rm {} \;
rm src/gfx/raw/* -rf

echo "### Compilation"
make gfx
make

echo "### Padbin pour execution du GBFS"
wine padbin.exe 256 GUIGUI_v$VERSION.gba

echo "### Lancement de l'émulateur"
#gvba GUIGUI_v$VERSION.gba
vba GUIGUI_v$VERSION.gba
