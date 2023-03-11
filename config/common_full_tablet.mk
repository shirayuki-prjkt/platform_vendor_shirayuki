# Inherit full common Lineage stuff
$(call inherit-product, vendor/shirayuki/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/shirayuki/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/shirayuki/overlay/dictionaries

$(call inherit-product, vendor/shirayuki/config/telephony.mk)
