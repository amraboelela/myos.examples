
ifeq ($(BASE_OS),android)
    LIB_NAME=ColorSpace
else
    APP_NAME=ColorSpace
endif

CFLAGS=-DDEBUG -fblocks
LDLIBS=-lCoreFoundation -lFoundation

ifeq ($(TARGET),NativeApp)
    LDLIBS+=-lNAIOKit -lNAUIKit -lNACoreGraphics
else
    LDLIBS+=-lIOKit -lUIKit -lCoreGraphics
endif

OBJECTS = \
    colorspace.o \

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
