# Set Lineage specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Lineage stuff
$(call inherit-product, vendor/shirayuki/config/common_full_phone.mk)
