
LIB_NAME=RedRectangle
CFLAGS=-DDEBUG -fblocks
LDLIBS=-lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit

OBJECTS = \
    AppDelegate.o \
    RRSolidView.o \
    main.o \

ifeq ($(BASE_OS),android)
    LDLIBS+=-llog -landroid
    OBJECTS+= rd_app_glue.o \
        rd_main.o \

endif

include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
