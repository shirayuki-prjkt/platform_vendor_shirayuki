# Versioning of the ROM

ifndef ROM_BUILDTYPE
    ROM_BUILDTYPE := COMMUNITY
endif

ifndef ROM_BUILDTIME_WITH_TIME
    ROM_BUILDTIME_WITH_TIME := y
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst shirayuki_,,$(TARGET_PRODUCT_SHORT))

ifeq ($(ROM_BUILDTIME_UTC),y)
    ifeq ($(ROM_BUILDTIME_WITH_TIME),y)
        ROM_VERSION := $(PLATFORM_VERSION)-$(shell date -u +%Y%m%d%H%M)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)
    else
        ROM_VERSION := $(PLATFORM_VERSION)-$(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)
    endif
else
    ifeq ($(ROM_BUILDTIME_WITH_TIME),y)
        ROM_VERSION := $(PLATFORM_VERSION)-$(shell date +%Y%m%d%H%M)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)
    else
        ROM_VERSION := $(PLATFORM_VERSION)-$(shell date +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)
    endif
endif

ROM_BRANCH := android-13.0

# Apply it to build.prop
PRODUCT_PRODUCT_PROPERTIES += \
    ro.modversion=ShirayukiProject-$(ROM_VERSION) \
    ro.shirayuki.version=$(ROM_VERSION) \
    ro.shirayuki.device=$(TARGET_PRODUCT_SHORT) \
    ro.shirayuki.branch=$(ROM_BRANCH)
