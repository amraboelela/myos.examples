
LDLIBS=-lFoundation

ifeq ($(APP_TYPE),NativeApp)
    LDLIBS+=-lNAOpenGLES -lNAUIKit -lNACoreGraphics -lNAQuartzCore
else
    LDLIBS+=-lOpenGLES -lUIKit -lCoreGraphics -lQuartzCore
endif

OBJECTS = \
    AppDelegate.o \
    AppleController.o \
    MyUIViewController.o \

include ${MYOS_PATH}/sdk/app-makefile
