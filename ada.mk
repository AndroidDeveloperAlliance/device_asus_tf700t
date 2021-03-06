# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, device/asus/tf700t/full_tf700t.mk)

$(call inherit-product, vendor/ada/config/common_full_tablet_wifionly.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/tf700t/tf700t-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/tf700t/overlay

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.cardhu.rc:root/init.cardhu.rc \
    $(LOCAL_PATH)/ramdisk/fstab.cardhu:root/fstab.cardhu \
    $(LOCAL_PATH)/ramdisk/ueventd.cardhu.rc:root/ueventd.cardhu.rc \
    $(LOCAL_PATH)/ramdisk/init.cardhu.usb.rc:root/init.cardhu.usb.rc

# Prebuilt configeration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/cpu.sh:system/bin/cpu.sh \
    $(LOCAL_PATH)/prebuilt/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/gpsconfig.xml:system/etc/gps/gpsconfig.xml
    	

# Prebuilt configeration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilt/asound.conf:system/etc/asound.conf

# Kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \

# Fuck surfaceflinger hack 
# TODO: figure out why i have to put up with this crap.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/surfaceflinger_hack.sh:system/bin/surfaceflinger_hack.sh

# Input device configeration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/idc/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    $(LOCAL_PATH)/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    $(LOCAL_PATH)/prebuilt/asusdec.kcm:system/usr/keychars/asusdec.kcm \
    $(LOCAL_PATH)/prebuilt/asusdec.kl:system/usr/keylayout/asusdec.kl \
    $(LOCAL_PATH)/prebuilt/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/prebuilt/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl

# Camera/WiFi/BT Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/nvram.txt:system/etc/nvram_4329.txt \
    $(LOCAL_PATH)/prebuilt/firmware/BCM4330B1_002.001.003.0750.0820.hcd:system/etc/firmware/BCM4330B1_002.001.003.0750.0820.hcd \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcmdhd.bin:system/vendor/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcmdhd_apsta.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcmdhd_p2p.bin:system/vendor/firmware/fw_bcmdhd_p2p.bin

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Build characteristics setting 
PRODUCT_CHARACTERISTICS := tablet

# This device have enough room for precise davick
PRODUCT_TAGS += dalvik.gc.type-precise

# Extra packages to build for this device
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    make_ext4fs \
    setup_fs \
    audio.a2dp.default \
    libaudioutils \
    libinvensense_mpl \
    blobpack_tfp \
    libasusdec_jni

# Propertys spacific for this device
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.opengles.version=131072 \
    persist.sys.usb.config=mtp,adb

# Tegra 3 spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1

# Prime spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.epad.model=TF700T \
    ro.product.model=TF700T \
    ro.sf.lcd_density=240

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

# Call the vendor to setup propiatory files
$(call inherit-product-if-exists, vendor/asus/tf700t/tf700t-vendor.mk)

# Device naming
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := ada_tf700t
PRODUCT_DEVICE := tf700t
PRODUCT_MODEL := tf700t
PRODUCT_BRAND := asus
PRODUCT_MANUFACTURER := asus
