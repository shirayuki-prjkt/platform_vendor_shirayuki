ifneq ($(TARGET_USES_KERNEL_PLATFORM),true)
include vendor/shirayuki/config/BoardConfigKernel.mk
endif

include vendor/shirayuki/config/BoardConfigSoong.mk
