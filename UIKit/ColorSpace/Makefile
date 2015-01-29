
LIB_NAME=ColorSpace
CFLAGS=-DDEBUG -fblocks
LDLIBS= -llog -landroid -lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit -lNACoreGraphics
#LDFLAGS=-v -Wl,--no-undefined
OBJECTS = \
    rd_app_glue.o \
    rd_main.o \
    AppDelegate.o \
    ColorSpaceView.o \

include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
