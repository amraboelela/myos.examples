
LDLIBS=-lFoundation

ifeq ($(APP_TYPE),NativeApp)
    LDLIBS+=-lIOKit_native -lCoreGraphics_native -lUIKit_native
else
    LDLIBS+=-lIOKit -lCoreGraphics -lUIKit
endif

OBJECTS = \
    main \
    arcs \
    ovals \
    rects \
    shapes \

include ${MYOS_PATH}/sdk/app-makefile
