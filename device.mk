#
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2018-2021 The Xiaomi-SDM660 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit the sdm660-common definitions
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

# Device Path
DEVICE_PATH := device/xiaomi/lavender

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	 $(DEVICE_PATH)/overlay \
	 $(DEVICE_PATH)/overlay-lineage

# PRODUCT_SHIPPING_API_LEVEL indicates the first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 28

# Audio
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
	$(DEVICE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
	$(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    camera.sdm660 \
    libMegviiFacepp-0.5.2

# Consumerir
BOARD_HAVE_IR := true

# Device properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Fingerprints
PRODUCT_PACKAGES += \
    com.fingerprints.extension@2.0.vendor

# FM
BOARD_HAVE_QCOM_FM := true

# Overlays
PRODUCT_PACKAGES += \
    LavenderApertureOverlay \
    LavenderFrameworksOverlay \
    LavenderSettingsOverlay \
    LavenderSystemUIOverlay \
    NoCutoutOverlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml

# Properties 
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/properties/product.prop

# Keylayout
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/sdm660-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sdm660-snd-card_Button_Jack.kl

# Ramdisk
PRODUCT_PACKAGES += \
	init.device.rc

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
	$(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
	$(DEVICE_PATH)/configs/sensors/elliptic.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/elliptic.conf

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# Wifi
PRODUCT_PACKAGES += \
    LavenderWifiOverlay

# Vendor files
$(call inherit-product, vendor/xiaomi/lavender/lavender-vendor.mk)

# AOSP DEVICE
PRODUCT_NAME := aosp_lavender
PRODUCT_DEVICE := lavender
PRODUCT_MODEL := Redmi Note 7 (AOSP)
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi

# Signing
SIGNING_KEY_PATH ?= certs
RELEASE_KEY := $(SIGNING_KEY_PATH)/releasekey
SIGNING_KEY_PATH ?= certs
RELEASE_KEY := $(SIGNING_KEY_PATH)/releasekey
PRODUCT_DEFAULT_DEV_CERTIFICATE := $(RELEASE_KEY)
PRODUCT_OTA_PUBLIC_KEYS := $(RELEASE_KEY)

