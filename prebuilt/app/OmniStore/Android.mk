LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := OmniStoreInstallerPrebuilt
LOCAL_SRC_FILES := OmniStoreInstaller.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_SYSTEM_EXT_MODULE := true
include $(BUILD_PREBUILT)
