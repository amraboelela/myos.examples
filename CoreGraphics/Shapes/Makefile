
LDLIBS=-lFoundation

ifeq ($(APP_TYPE),NativeApp)
    LDLIBS+=-lNAIOKit -lNACoreGraphics -lNAUIKit
else
    LDLIBS+=-lIOKit -lCoreGraphics -lUIKit
endif

OBJECTS = \
    arcs.o \
    ovals.o \
    rects.o \
    shapes.o \

include ${MYOS_PATH}/sdk/app-makefile
