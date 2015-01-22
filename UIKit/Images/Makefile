
LIB_NAME=Images
CFLAGS=-DDEBUG -fblocks
LDLIBS= -llog -landroid -lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit -lNACoreGraphics
#LDFLAGS=-v -Wl,--no-undefined
OBJECTS = \
    rd_app_glue.o \
    rd_main.o \
    AppDelegate.o \
    ImagesView.o \

include ${MYOS_PATH}/android/sdk/resources/makefile-shared
