
LDLIBS=-lFoundation

ifeq ($(APP_TYPE),NativeApp)
    LDLIBS+=-lIOKit_native -lCoreGraphics_native -lUIKit_native
else
    LDLIBS+=-lIOKit -lCoreGraphics -lUIKit
endif

OBJECTS = \
    main \
    shadows \

include ${MYOS_PATH}/sdk/app-makefile
