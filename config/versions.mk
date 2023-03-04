# Versioning System
<<<<<<< HEAD
SHIRAYUKI_VERSION = Tsushima
=======
SHIRAYUKI_VERSION = v2.9
>>>>>>> 1e0fb305f52f2e0aa155e4823c13b6b7f1424866

ifndef SHIRAYUKI_BUILD_TYPE
    SHIRAYUKI_BUILD_TYPE := UNOFFICIAL
endif

<<<<<<< HEAD
=======
ifndef SHIRAYUKI_MAINTAINER
    SHIRAYUKI_MAINTAINER := Unofficial Maintainer? Yuki cannot recognize the maintainer
endif

>>>>>>> 1e0fb305f52f2e0aa155e4823c13b6b7f1424866
# Set all versions
SHIRAYUKI_DATE := $(shell date -u +%Y%m%d-%H%M)
TARGET_BACON_NAME := $(TARGET_PRODUCT)-$(SHIRAYUKI_VERSION)-$(SHIRAYUKI_DATE)-$(SHIRAYUKI_BUILD_TYPE)
SHIRAYUKI_FINGERPRINT := Shirayuki/$(SHIRAYUKI_VERSION)/$(PLATFORM_VERSION)/$(BUILD_ID)/$(SHIRAYUKI_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.shirayuki.version=$(SHIRAYUKI_VERSION) \
    com.shirayuki.fingerpring=$(SHIRAYUKI_FINGERPRINT) \
    ro.shirayuki.display.version=Shirayuki-$(SHIRAYUKI_VERSION) \
<<<<<<< HEAD
=======
    ro.shirayuki.maintainer=$(SHIRAYUKI_MAINTAINER) \
>>>>>>> 1e0fb305f52f2e0aa155e4823c13b6b7f1424866
    ro.shirayuki.releasetype=$(SHIRAYUKI_BUILD_TYPE) \
    ro.modversion=$(TARGET_BACON_NAME)
