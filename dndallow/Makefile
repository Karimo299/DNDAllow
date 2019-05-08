ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DNDAllow
DNDAllow_FILES = DNDARootListController.m
DNDAllow_INSTALL_PATH = /Library/PreferenceBundles
DNDAllow_FRAMEWORKS = UIKit
DNDAllow_PRIVATE_FRAMEWORKS = Preferences
DNDAllow_EXTRA_FRAMEWORKS += CepheiPrefs
DNDAllow_LIBRARIES = applist

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DNDAllow.plist$(ECHO_END)
