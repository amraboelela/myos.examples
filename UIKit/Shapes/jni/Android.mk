
include $(CLEAR_VARS)
LOCAL_MODULE := Shapes
LOCAL_SRC_FILES := ${MYOS_PATH}/android/examples/UIKit/Shapes/libShapes.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := CoreFoundation
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libCoreFoundation.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Foundation
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libFoundation.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NACoreGraphics
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libNACoreGraphics.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NACoreText
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libNACoreText.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NAIOKit
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libNAIOKit.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NAOpenGLES
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libNAOpenGLES.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NACoreAnimation
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libNACoreAnimation.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NAUIKit
LOCAL_SRC_FILES := $(MYOS_PATH)/android/frameworks/libs/libNAUIKit.so
include $(PREBUILT_SHARED_LIBRARY)
