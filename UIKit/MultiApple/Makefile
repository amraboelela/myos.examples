
LIB_NAME=MultiApple
CFLAGS=-DDEBUG -fblocks
LDLIBS= -llog -landroid -lCoreFoundation -lFoundation -lNAOpenGLES -lNACoreAnimation -lNAUIKit -lNACoreGraphics

OBJECTS = \
    rd_app_glue.o \
    rd_main.o \
    AppDelegate.o \
    AppleController.o \
    MyUIViewController.o \

include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
