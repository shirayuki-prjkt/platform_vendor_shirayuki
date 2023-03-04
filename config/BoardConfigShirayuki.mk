include vendor/shirayuki/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/shirayuki/config/BoardConfigQcom.mk
endif

include vendor/shirayuki/config/BoardConfigSoong.mk
