# Inherit common AOSP stuff
$(call inherit-product, vendor/shirayuki/config/common.mk)

$(call inherit-product, vendor/shirayuki/config/telephony.mk)

$(call inherit-product, vendor/shirayuki/config/shirayuki_props.mk)

$(call inherit-product, vendor/google/pixel/config.mk)

<<<<<<< HEAD
=======
ifeq ($(WITH_GMS),true)
$(call inherit-product, vendor/google/gms/config.mk)
endif
>>>>>>> 1e0fb305f52f2e0aa155e4823c13b6b7f1424866
