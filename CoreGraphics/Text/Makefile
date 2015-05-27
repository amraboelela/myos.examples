
ifeq ($(BASE_OS),android)
    LIB_NAME=Text
else
    APP_NAME=Text
endif

CFLAGS=-DDEBUG -fblocks
LDLIBS=-lCoreFoundation -lFoundation

ifeq ($(APP_TYPE),NativeApp)
    LDLIBS+=-lNAIOKit -lNAUIKit -lNACoreGraphics
else
    LDLIBS+=-lIOKit -lUIKit -lCoreGraphics
endif

OBJECTS = \
    text.o \

ifeq ($(BASE_OS),android)
    LDLIBS+=-llog -landroid
    OBJECTS+= \
        rd_app_glue.o \
        d_main.o \

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
else
    OBJECTS+= \
        main.o \

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-executable
endif
