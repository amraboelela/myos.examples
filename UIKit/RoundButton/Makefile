
ifeq ($(BASE_OS),android)
    LIB_NAME=RoundButton
else
    APP_NAME=RoundButton
endif

CFLAGS=-DDEBUG -fblocks
LDLIBS=-lCoreFoundation -lFoundation

ifeq ($(TARGET),NativeApp)
    LDLIBS+=-lNAOpenGLES -lNAUIKit -lNACoreGraphics -lNAQuartzCore
else
    LDLIBS+=-lOpenGLES -lUIKit -lCoreGraphics -lQuartzCore
endif

OBJECTS = \
    AppDelegate.o \
    RoundButtonView.o \

ifeq ($(BASE_OS),android)
    LDLIBS+=-llog -landroid
    OBJECTS+= \
        rd_app_glue.o \
        rd_main.o \

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
else
    OBJECTS+= \
        main.o \

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-executable
endif
