
LIB_NAME=UIViewController
CFLAGS=-DDEBUG -fblocks
LDLIBS= -llog -landroid -lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit
#LDFLAGS=-v -Wl,--no-undefined
OBJECTS = \
    rd_app_glue.o \
    rd_main.o \
    AppDelegate.o \
    RedRectangleVC.o \
    RRSolidView.o \

include ${MYOS_PATH}/android/sdk/resources/makefile-shared
