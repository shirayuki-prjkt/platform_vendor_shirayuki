# Inherit common stuff
$(call inherit-product, vendor/shirayuki/config/common.mk)

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/selective-spn-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/selective-spn-conf.xml

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/shirayuki/prebuilt/etc/spn-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/spn-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
<<<<<<< HEAD
    CellBroadcastReceiver
=======
    CellBroadcastReceiver
>>>>>>> 1e0fb305f52f2e0aa155e4823c13b6b7f1424866
