# Inherit mini common Lineage stuff
$(call inherit-product, vendor/shirayuki/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME
