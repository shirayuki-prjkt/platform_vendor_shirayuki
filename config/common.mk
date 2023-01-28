PRODUCT_BRAND ?= shirayuki

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Yuki GApps
ifeq ($(TARGET_GAPPS_ARCH),arm)
     -include vendor/yuki/gapps/arm/arm-vendor.mk
     $(warning "Using arm GApps Variant")
else ifeq ($(TARGET_GAPPS_ARCH),arm64)
     -include vendor/yuki/gapps/arm64/arm64-vendor.mk
     $(warning "Using arm64 GApps Variant")
else ifeq ($(TARGET_GAPPS_ARCH),x86)
     -include vendor/yuki/gapps/x86/x86-vendor.mk
     $(warning "Using x86 GApps Variant")
else ifeq ($(TARGET_GAPPS_ARCH),x86_64)
     -include vendor/yuki/gapps/x86_64/x86_64-vendor.mk
     $(warning "Using x86_64 GApps Variant")
else
    ifeq ($(TARGET_GAPPS_ARCH),)
        $(warning "TARGET_GAPPS_ARCH is undefined, assuming vanilla variant")
endif

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# general properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.build.selinux=1 \
    persist.sys.disable_rescue=true

# Google assistant
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_PRODUCT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Enforce privapp-permissions whitelist
#OMNI_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/bin/clean_cache.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/clean_cache.sh

# Backup Tool
ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/shirayuki/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/shirayuki/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
ifeq ($(filter $(ROM_BUILDTYPE), GAPPS MICROG),)
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/addon.d/69-gapps.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/69-gapps.sh
endif
else
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/bin/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool.sh \
    vendor/shirayuki/prebuilt/bin/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool.functions \
    vendor/shirayuki/prebuilt/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/sysconfig/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# bg excemption whitelist
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/sysconfig/shirayukiota.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/shirayukiota.xml

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/init.shirayuki.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.shirayuki.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

#permissions
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/permissions/privapp-permissions-shirayuki.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-shirayuki.xml

PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/permissions/privapp-permissions-shirayuki-ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-shirayuki-ext.xml

# custom omni sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=omni_ringtone1.ogg \
    ro.config.notification_sound=omni_notification1.ogg \
    ro.config.alarm_alert=omni_alarm1.ogg

PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/sounds/camera_click_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_click.ogg \
    vendor/shirayuki/prebuilt/sounds/VideoRecord_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/VideoRecord.ogg \
    vendor/shirayuki/prebuilt/sounds/VideoStop_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/VideoStop.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_ringtone1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/omni_ringtone1.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_ringtone2.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/omni_ringtone2.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_ringtone3.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/omni_ringtone3.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_alarm1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/omni_alarm1.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_alarm2.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/omni_alarm2.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_notification1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/omni_notification1.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_lowbattery1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/omni_lowbattery1.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_lock_phone.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/omni_lock_phone.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_unlock_phone.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/omni_unlock_phone.ogg \
    vendor/shirayuki/prebuilt/sounds/omni_charge_start.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/ChargingStarted.ogg

# mkshrc
#PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/mkshrc:$(TARGET_COPY_OUT_SYSTEM)/etc/mkshrc

# We modify several neverallows, so let the build proceed
ifneq ($(TARGET_BUILD_VARIANT),eng)
SELINUX_IGNORE_NEVERALLOWS := true
endif

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS), true)
# Don't preopt prebuilts
DONT_DEXPREOPT_PREBUILTS := true

# Use 64-bit dex2oat for better dexopt time.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat64.enabled=true
endif

PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.boot=verify \
    pm.dexopt.first-boot=verify \
    pm.dexopt.install=speed-profile \
    pm.dexopt.bg-dexopt=everything

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.ab-ota=verify
endif

#ADB
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.service.adb.enable=1

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Dedupe VNDK libraries with identical core variants
TARGET_VNDK_USE_CORE_VARIANT := true

# Use a generic profile based boot image by default
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := art/build/boot/boot-image-profile.txt

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Enable whole-program R8 Java optimizations for SystemUI and system_server,
# but also allow explicit overriding for testing and development.
SYSTEM_OPTIMIZE_JAVA ?= true
SYSTEMUI_OPTIMIZE_JAVA ?= true

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# IORap app launch prefetching using Perfetto traces and madvise
PRODUCT_PRODUCT_PROPERTIES += \
    ro.iorapd.enable=true

PRODUCT_SYSTEM_PROPERTIES += \
    persist.device_config.runtime_native_boot.iorap_perfetto_enable=true

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false

# whitelist packages for location providers not in $(TARGET_COPY_OUT_SYSTEM)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.services.whitelist.packagelist=com.google.android.gms

PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Bootanimation
$(call inherit-product, vendor/shirayuki/config/bootanimation.mk)

# Additional packages
-include vendor/shirayuki/config/packages.mk

# Set support one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# SystemUI plugins
ifeq ($(ROM_BUILDTYPE),$(filter $(ROM_BUILDTYPE),GAPPS))
PRODUCT_PACKAGES += \
    QuickAccessWallet
endif

# Inherit common product build prop overrides
-include vendor/shirayuki/config/version.mk

# Add our overlays
DEVICE_PACKAGE_OVERLAYS += vendor/shirayuki/overlay/common
