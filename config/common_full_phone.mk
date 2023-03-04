# Inherit common stuff
$(call inherit-product, vendor/shirayuki/config/common.mk)

# Enable tethering
PRODUCT_PROPERTY_OVERRIDES += \
<<<<<<< HEAD
    persist.sys.dun.override=0
=======
    persist.sys.dun.override=0
>>>>>>> 1e0fb305f52f2e0aa155e4823c13b6b7f1424866
