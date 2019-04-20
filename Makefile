ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DNDAllow
DNDAllow_FILES = Tweak.xm
DNDAllow_EXTRA_FRAMEWORKS += Cephei
DNDAllow_LIBRARIES = applist


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += dndallow
include $(THEOS_MAKE_PATH)/aggregate.mk
