
ifeq ($(BASE_OS),android)
    LIB_NAME=RedRectangle
else
    APP_NAME=RedRectangle
endif

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

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
else
    include ${MYOS_PATH}/android/sdk/resources/makefile-executable
endif
