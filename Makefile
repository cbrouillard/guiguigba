#################################
# HAM Makefile
#################################

include $(HAMDIR)/system/master.mak

ADD_LIBS += $(GCCARM)/lib/libhel2.a

#
# Set the name of your desired GBA image name here
#
PROGNAME = GUIGUI_v1.0

#
# Set a list of files you want to compile
# Please let the libgbfs.o at last position. IMPORTANT !
#
OFILES += src/main.o src/gfx/ResourceData.o

######################################
# Standard Makefile targets start here
######################################

all : $(PROGNAME).$(EXT) clean

#
# Most Makefile targets are predefined for you, suchas
# vba, clean ... in the following file
#
include $(HAMDIR)/system/standard-targets.mak

######################################
# custom  Makefile targets start here
######################################
.PHONY gfx: makefile
	$(HAMDIR)/tools/linux/gfx2gba -t8 -m -fraw -osrc/gfx/raw -pscreen.pal src/gfx/img/screens/img*.bmp src/gfx/img/screens/text.bmp
	$(HAMDIR)/tools/linux/gfx2gba -t8 -D -c16 -fraw -osrc/gfx/raw -psprites.pal src/gfx/img/sprites/*.bmp
	wine $(HAMDIR)/tools/win32/katie.exe --output-asm-arm --output-h --output-h-filename src/gfx/ResourceData.h --output-asm-arm-filename src/gfx/ResourceData.s src/gfx/raw/*.*
