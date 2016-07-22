# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/samsung/vivalto3gvn/device.mk)

# Keylayouts
KEYLAYOUT_FILES := \
	device/samsung/vivalto3gvn/keylayouts/ist30xx_ts_input.kl \
	device/samsung/vivalto3gvn/keylayouts/sci-keypad.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(KEYLAYOUT_FILES),$(f):system/usr/keylayout/$(notdir $(f)))

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	f2fstat \
	fsck.f2fs \
	fibmap.f2fs \
	mkfs.f2fs

# Bluetooth config
BLUETOOTH_CONFIGS := \
	device/samsung/vivalto3gvn/configs/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
	$(foreach f,$(BLUETOOTH_CONFIGS),$(f):system/etc/bluetooth/$(notdir $(f)))

# Media config
MEDIA_CONFIGS := \
	device/samsung/vivalto3gvn/media/media_codecs.xml \
	device/samsung/vivalto3gvn/media/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

# HWC
PRODUCT_PACKAGES += \
	gralloc.scx15 \
	hwcomposer.scx15 \
	sprd_gsp.scx15 \
	libion_sprd \
	libdither \

# Codecs
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_sprd_soft_h264dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec \

# Lights
PRODUCT_PACKAGES += \
	lights.scx15

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default \

# Audio
PRODUCT_PACKAGES += \
	audio.primary.scx15 \
	audio_policy.scx15 \
	libaudio-resampler \
	libatchannel_wrapper \

AUDIO_CONFIGS := \
	device/samsung/vivalto3gvn/configs/audio/audio_policy.conf \
	device/samsung/vivalto3gvn/configs/audio/audio_hw.xml \
	device/samsung/vivalto3gvn/configs/audio/audio_para \
	device/samsung/vivalto3gvn/configs/audio/codec_pga.xml \
	device/samsung/vivalto3gvn/configs/audio/tiny_hw.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(AUDIO_CONFIGS),$(f):system/etc/$(notdir $(f))) \

# Common libraries
PRODUCT_PACKAGES += \
	libmemoryheapion_sprd

# Shim libraries
PRODUCT_PACKAGES += \
	libril_shim \
	libgps_shim \

# GPS
GPS_CONFIGS := \
	device/samsung/vivalto3gvn/configs/gps/gps.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(GPS_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Nvitem
NVITEM_CONFIGS := \
	device/samsung/vivalto3gvn/configs/nvitem/nvitem_td.cfg \
	device/samsung/vivalto3gvn/configs/nvitem/nvitem_w.cfg

PRODUCT_COPY_FILES += \
	$(foreach f,$(NVITEM_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Wifi
WIFI_CONFIGS := \
	device/samsung/vivalto3gvn/configs/wifi/wpa_supplicant.conf \
	device/samsung/vivalto3gvn/configs/wifi/nvram_net.txt \

PRODUCT_COPY_FILES += \
	$(foreach f,$(WIFI_CONFIGS),$(f):system/etc/wifi/$(notdir $(f)))

# Radio
PRODUCT_PACKAGES += \
	FMRadio \
	radio.fm.default \

# Memtrack
PRODUCT_PACKAGES += \
	memtrack.scx15 \

# Permissions
PERMISSION_XML_FILES := \
	device/samsung/vivalto3gvn/permissions/platform.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# Scripts
SCRIPTS_FILES := \
	device/samsung/vivalto3gvn/scripts/set_freq.sh

PRODUCT_COPY_FILES += \
	$(foreach f,$(SCRIPTS_FILES),$(f):system/bin/$(notdir $(f)))

# Device props
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=8m \
	dalvik.vm.dex2oat-Xmx=96m \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.dex2oat-filter=speed \
	dalvik.vm.image-dex2oat-Xms=48m \
	dalvik.vm.image-dex2oat-Xmx=48m \
	dalvik.vm.image-dex2oat-filter=everything

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_vivalto3gvn
PRODUCT_DEVICE := vivalto3gvn
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-G313HZ
