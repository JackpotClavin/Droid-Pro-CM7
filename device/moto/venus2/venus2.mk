#
# Copyright (C) 2009 The Android Open Source Project
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
#

#
# This is the product configuration for a generic CDMA venus2,
# not specialized for any geography.
#

DEVICE_PREBUILT := device/moto/venus2/prebuilt

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to CDMA

PRODUCT_COPY_FILES += \
    device/moto/venus2/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/moto/venus2/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc

## (2) Also get non-open-source CDMA-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/venus2/venus2-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-CDMA-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.ril=yes \
    persist.ril.mux.noofchannels=8 \
    persist.ril.mux.ttydevice=/dev/ttyS0 \
    persist.ril.modem.ttydevice=/dev/usb/tty1-3:1.4 \
    persist.ril.features=0x0E \
    persist.ril.mux.retries=500 \
    persist.ril.mux.sleep=2 \
    ro.default_usb_mode=4 \
    ro.product.multi_touch_enabled=true \
    ro.product.max_num_touch=2 \
    ro.telephony.sms_segment_size=160 \
    ro.setupwizard.mode=OPTIONAL \
    ro.com.google.gmsversion=2.2_r7 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=1000 \
    ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=A855 \
    ro.setupwizard.enable_bypass=1 \
    ro.com.google.clientid=android-motorola \
    ro.com.google.clientidbase=android-verizon \
    ro.com.google.clientidbase.am=android-verizon \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.config.vc_call_vol_steps=7 \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
    ro.com.motorola.smartsensor=true \
    ro.media.capture.maxres=5m \
    ro.media.capture.fast.fps=4 \
    ro.media.capture.slow.fps=60 \
    ro.media.capture.flash=led \
    ro.media.capture.classification=classF \
    ro.media.capture.useDFR=1 \
    ro.media.capture.torchIntensity=45 \
    ro.media.camera.focal=3564.0,3564.0 \
    ro.media.camera.principal=1632.0,1224.0 \
    ro.media.camera.skew=0.0 \
    ro.media.camera.distortion=0.0,0.0,0.0,0.0,0.0 \
    ro.media.camera.calresolution=3264,2448

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# keylayouts
PRODUCT_COPY_FILES += \
    device/moto/venus2/keychars/cdma_venus2-keypad.kcm.bin:system/usr/keychars/cdma_venus2-keypad.kcm.bin \
    device/moto/venus2/keychars/cdma_venus2-keypad.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/moto/venus2/keychars/cdma_venus2-keypad.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/moto/venus2/keylayout/cdma_venus2-keypad.kl:system/usr/keylayout/cdma_venus2-keypad.kl \
    device/moto/venus2/keylayout/cdma_venus2-keypad.kl:system/usr/keylayout/qwerty.kl

PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/bin/hijack:system/bin/hijack \
    $(DEVICE_PREBUILT)/bin/bootmenu:system/bin/bootmenu \
    $(DEVICE_PREBUILT)/bin/adbd:system/bin/adbd \
    $(DEVICE_PREBUILT)/bin/hijack.log_dump:system/bin/hijack.log_dump \
    $(DEVICE_PREBUILT)/ramdisk/default.prop:root/default.prop \
    $(DEVICE_PREBUILT)/ramdisk/init.goldfish.rc:root/init.goldfish.rc \
    $(DEVICE_PREBUILT)/ramdisk/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    $(DEVICE_PREBUILT)/ramdisk/init.rc:root/init.rc \
    $(DEVICE_PREBUILT)/ramdisk/init:root/init \
    $(DEVICE_PREBUILT)/ramdisk/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(DEVICE_PREBUILT)/ramdisk/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc \
    $(DEVICE_PREBUILT)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(DEVICE_PREBUILT)/ramdisk/sbin/2nd-init:root/sbin/2nd-init \
    $(DEVICE_PREBUILT)/ramdisk/sbin/adbd:root/sbin/adbd \
    $(DEVICE_PREBUILT)/ramdisk/sbin/getprop:root/sbin/getprop \
    $(DEVICE_PREBUILT)/ramdisk/sbin/hijack:root/sbin/hijack \
    $(DEVICE_PREBUILT)/ramdisk/sbin/hijack.killall:root/sbin/hijack.killall \
    $(DEVICE_PREBUILT)/ramdisk/sbin/stop:root/sbin/stop \
    $(DEVICE_PREBUILT)/etc/fstab:system/etc/fstab \
    $(DEVICE_PREBUILT)/bin/voicesearch.sh:system/bin/voicesearch.sh \
    $(DEVICE_PREBUILT)/bin/mac-address-fix.sh:system/bin/mac-address-fix.sh \
    $(DEVICE_PREBUILT)/bin/nvs_map_gen.txt:system/bin/nvs_map_gen.txt

# media config xml file
PRODUCT_COPY_FILES += \
    device/moto/venus2/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    tiwlan.ini \
    dspexec \
    libbridge \
    overlay.omap3 \
    wlan_cu \
    libtiOsLib \
    wlan_loader \
    libCustomWifi \
    wpa_supplicant.conf \
    dhcpcd.conf \
    libOMX.TI.AAC.encode \
    libOMX.TI.AMR.encode \
    libOMX.TI.WBAMR.encode \
    libOMX.TI.JPEG.Encoder \
    libLCML \
    libOMX_Core \
    libOMX.TI.Video.Decoder \
    libOMX.TI.Video.encoder \
    libVendor_ti_omx \
    gps.venus2 \
    Usb \
    libaudiopolicy \
    mot_boot_mode \
    charge_only_mode \
    lights.venus2

#We don't need these packages these we are -for now- in the prop files
#    sensors.venus2

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# venus2 uses high-density artwork where available
PRODUCT_LOCALES += mdpi

PRODUCT_COPY_FILES += \
    device/moto/venus2/DroidXBootstrap.cfg:system/etc/DroidXBootstrap.cfg \
    device/moto/venus2/venus2Bootstrap.cfg:system/etc/venus2Bootstrap.cfg \
    device/moto/venus2/vold.fstab:system/etc/vold.fstab \
    device/moto/venus2/mount_ext3.sh:system/bin/mount_ext3.sh

# these need to be here for the installer, just put them here for now
PRODUCT_COPY_FILES += \
    device/moto/venus2/utilities/mke2fs:system/bin/mke2fs \
    device/moto/venus2/utilities/tune2fs:system/bin/tune2fs \
    device/moto/venus2/releaseutils/check_kernel:system/etc/check_kernel \
    device/moto/venus2/releaseutils/finalize_release:system/etc/finalize_release

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/moto/venus2/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/moto/venus2/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, vendor/moto/venus2/venus2-vendor.mk)

# stuff common to all Motorola phones
#$(call inherit-product, device/moto/common/common_hijack.mk)

$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, device/moto/venus2/prebuilt/bootmenu/Bootmenu.mk)

# use venus2 overlay
DEVICE_PACKAGE_OVERLAYS += device/moto/venus2/overlay

PRODUCT_NAME := generic_venus2
PRODUCT_DEVICE := venus2
