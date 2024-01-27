TARGET := iphone:clang:16.5:14.5
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PingHook

PingHook_FILES = Tweak.xm
PingHook_CFLAGS = -fobjc-arc -w

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
