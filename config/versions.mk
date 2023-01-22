# Versioning System
SHIRAYUKI_VERSION = v2.9

ifndef SHIRAYUKI_BUILD_TYPE
    SHIRAYUKI_BUILD_TYPE := UNOFFICIAL
endif

ifndef SHIRAYUKI_MAINTAINER
    SHIRAYUKI_MAINTAINER := Unofficial Maintainer? Yuki cannot recognize the maintainer
endif

# Set all versions
SHIRAYUKI_DATE := $(shell date -u +%Y%m%d-%H%M)
TARGET_BACON_NAME := $(TARGET_PRODUCT)-$(SHIRAYUKI_VERSION)-$(SHIRAYUKI_DATE)-$(SHIRAYUKI_BUILD_TYPE)
SHIRAYUKI_FINGERPRINT := Shirayuki/$(SHIRAYUKI_VERSION)/$(PLATFORM_VERSION)/$(BUILD_ID)/$(SHIRAYUKI_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.shirayuki.version=$(SHIRAYUKI_VERSION) \
    com.shirayuki.fingerpring=$(SHIRAYUKI_FINGERPRINT) \
    ro.shirayuki.display.version=Shirayuki-$(SHIRAYUKI_VERSION) \
    ro.shirayuki.maintainer=$(SHIRAYUKI_MAINTAINER) \
    ro.shirayuki.releasetype=$(SHIRAYUKI_BUILD_TYPE) \
    ro.modversion=$(TARGET_BACON_NAME)
