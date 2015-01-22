
LIB_NAME=Layers
CFLAGS=-DDEBUG -fblocks
LDLIBS= -llog -landroid -lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit -lNACoreGraphics
LDFLAGS=-v -Wl,--no-undefined
OBJECTS = \
    rd_app_glue.o \
    rd_main.o \
    AppDelegate.o \
    Layers.o \
    BlueView.o \
    SmileyFaceView.o \

include ${MYOS_PATH}/android/sdk/resources/makefile-shared
