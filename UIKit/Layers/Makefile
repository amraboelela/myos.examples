
ifeq ($(BASE_OS),android)
    LIB_NAME=Layers
else
    APP_NAME=Layers
endif

CFLAGS=-DDEBUG -fblocks
LDLIBS=-lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit -lNACoreGraphics

OBJECTS = \
    AppDelegate.o \
    Layers.o \
    BlueView.o \
    SmileyFaceView.o \
    main.o \

ifeq ($(BASE_OS),android)
    LDLIBS+=-llog -landroid
    OBJECTS+= \
        rd_app_glue.o \
        rd_main.o \

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
else
    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-executable
endif
