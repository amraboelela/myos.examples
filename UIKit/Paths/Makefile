
ifeq ($(BASE_OS),android)
    LIB_NAME=Paths
else
    APP_NAME=Paths
endif

CFLAGS=-DDEBUG -fblocks
LDLIBS=-lCoreFoundation -lFoundation -lNAOpenGLES -lNAUIKit -lNACoreGraphics

OBJECTS = \
    AppDelegate.o \
    PathsView.o \

ifeq ($(BASE_OS),android)
    LDLIBS+=-llog -landroid
    OBJECTS+= \
        rd_app_glue.o \
        rd_main.o \

    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-shared
else
    include ${MYOS_PATH}/sdk/$(BASE_OS)/makefile-executable
endif
