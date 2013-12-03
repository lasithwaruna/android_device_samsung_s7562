# Copyright (C) 2013 The CyanogenMod Project
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

DEVICE_PACKAGE_OVERLAYS += device/samsung/kyleopen/overlay

LOCAL_PATH := device/samsung/kyleopen
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/kernel.s7562
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
    
## Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a
    
## Other HALs
PRODUCT_PACKAGES += \
    lights.msm7x27a \
    power.msm7x27a 
    
## Rootdir
PRODUCT_COPY_FILES += \
    device/samsung/kyleopen/boot/init.qcom.rc:root/init.qcom.rc \
    device/samsung/kyleopen/boot/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/kyleopen/boot/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/samsung/kyleopen/boot/lpm.rc:root/lpm.rc
    
## Keylayouts, Keymaps, Etc
PRODUCT_COPY_FILES += \
    device/samsung/kyleopen/prebuilts/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc \
    device/samsung/kyleopen/prebuilts/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    device/samsung/kyleopen/prebuilts/usr/keychars/sec_touchscreen.kcm:system/usr/keychars/sec_touchscreen.kcm \
    device/samsung/kyleopen/prebuilts/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/samsung/kyleopen/prebuilts/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/kyleopen/prebuilts/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl
    
## Vold
PRODUCT_COPY_FILES += \
    device/samsung/kyleopen/prebuilts/vold.fstab:system/etc/vold.fstab

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kyleopen
PRODUCT_DEVICE := kyleopen

## Other
#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dexopt-data-only=1 persist.fuse_sdcard=false ro.sf.lcd_density=240
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

