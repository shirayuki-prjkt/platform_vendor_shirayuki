PRODUCT_BRAND ?= shirayuki

# use specific resolution for bootanimation
ifneq ($(TARGET_BOOTANIMATION_SIZE),)
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/bootanimation/res/$(TARGET_BOOTANIMATION_SIZE).zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
OMNI_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
OMNI_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
OMNI_PRODUCT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.build.selinux=1

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/shirayuki/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/shirayuki/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/shirayuki/prebuilt/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/sysconfig/backup.xml:system/etc/sysconfig/backup.xml

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/init.local.rc:root/init.yuki.rc

# permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    vendor/shirayuki/prebuilt/etc/permissions/privapp-permissions-shirayuki.xml:system/etc/permissions/privapp-permissions-shirayuki.xml

# custom omni sounds
OMNI_PRODUCT_PROPERTIES += \
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
    vendor/shirayuki/prebuilt/sounds/omni_unlock_phone.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/omni_unlock_phone.ogg

# Additional packages
-include vendor/shirayuki/utils/omni_emulator/packages.mk

# Versioning
-include vendor/shirayuki/config/version.mk

# Add our overlays
DEVICE_PACKAGE_OVERLAYS += vendor/shirayuki/overlay/common