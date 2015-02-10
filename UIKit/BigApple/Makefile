
ifeq ($(BASE_OS),android)
    LIB_NAME=BigApple
else
    APP_NAME=BigApple
endif

CFLAGS=-DDEBUG -fblocks
LDLIBS=-lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit -lNACoreGraphics

OBJECTS = \
    AppDelegate.o \

ifeq ($(BASE_OS),android)
    LDLIBS+=-llog -landroid
    OBJECTS+= \
    rd_app_glue.o \
    rd_main.o \

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
else
    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-executable
endif
