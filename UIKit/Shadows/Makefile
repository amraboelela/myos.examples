
LDLIBS=-lFoundation

ifeq ($(APP_TYPE),NativeApp)
    LDLIBS+=-lOpenGLES_native -lUIKit_native -lCoreGraphics_native -lQuartzCore_native
else
    LDLIBS+=-lOpenGLES -lUIKit -lCoreGraphics -lQuartzCore
endif

OBJECTS = \
    AppDelegate.o \
    ShadowsView.o \

include ${MYOS_PATH}/sdk/app-makefile
