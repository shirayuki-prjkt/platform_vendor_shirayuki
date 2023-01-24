# Versioning of the ROM

ifndef ROM_BUILDTYPE
    ROM_BUILDTYPE := HOMEMADE
endif

ifndef ROM_BUILDTIME_WITH_TIME
    ROM_BUILDTIME_WITH_TIME := y
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst shirayuki_,,$(TARGET_PRODUCT_SHORT))

# Build the final version string
ifeq ($(ROM_BUILDTYPE),GAPPS)
include vendor/gapps/config.mk
    VENDOR_EXCEPTION_PATHS += \
    gapps
endif
ifeq ($(ROM_BUILDTYPE),MICROG)
include vendor/microg/microg.mk
    VENDOR_EXCEPTION_PATHS += \
    microg
endif
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
