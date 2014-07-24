$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/u2-common/overlay

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

## Scripts and confs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fs/root/sbin/fstrim:root/sbin/fstrim \
	$(LOCAL_PATH)/fs/root/sbin/fstrim:recovery/root/sbin/fstrim \
	$(LOCAL_PATH)/fs/root/sbin/bb/busybox:root/sbin/bb/busybox \
    $(LOCAL_PATH)/init.u2.usb.rc:root/init.u2.usb.rc \
    $(LOCAL_PATH)/init.u2.rc:root/init.u2.rc \
    $(LOCAL_PATH)/ueventd.u2.rc:root/ueventd.u2.rc \
	$(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

F2FSMOD := true
ifdef F2FSMOD
	PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.u2:root/fstab.u2
else
		PRODUCT_COPY_FILES += \
	    $(LOCAL_PATH)/fstab.u2-ext4:root/fstab.u2
endif


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/touch_dev.idc:system/usr/idc/touch_dev.idc \
    $(LOCAL_PATH)/configs/touch_dev.kl:system/usr/keylayout/touch_dev.kl \
    $(LOCAL_PATH)/configs/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl

# stagefright confs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# wifi nvram calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

# RIL stuffs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ipc_channels.config:system/etc/ipc_channels.config

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    $(LOCAL_PATH)/fs/system/etc/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    $(LOCAL_PATH)/fs/system/etc/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	 frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

## GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml \
	 $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/SuplRootCert:system/etc/SuplRootCert

$(call inherit-product, build/target/product/full.mk)

PRODUCT_AAPT_CONFIG := normal hdpi

PRODUCT_PACKAGES += \
    wifimac \
    libnetcmdiface

PRODUCT_PACKAGES += \
    lights.omap4 \
    libaudioutils \
    audio.a2dp.default \
    audio_policy.default \
    audio.primary.u2 \
	audio.hdmi.u2 \
    audio.usb.default \
	audio.r_submix.default \
    camera.u2 \
    hwcomposer.u2 \
	power.u2

# OMAP4 OMX
PRODUCT_PACKAGES += \
    libdomx \
    libOMX_Core \
    libOMX.TI.DUCATI1.VIDEO.H264E \
    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
    libOMX.TI.DUCATI1.VIDEO.DECODER \
    libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
    libOMX.TI.DUCATI1.VIDEO.CAMERA \
    libOMX.TI.DUCATI1.MISC.SAMPLE \
    libstagefrighthw \
    libI420colorconvert \
    libtiutils_custom \
    libion_ti \
    smc_pa_ctrl \
    tf_daemon \
    libtf_crypto_sst \
    libmm_osal \
    gralloc.omap4.so

#
PRODUCT_PACKAGES += \
    libtiutils \
    libipcutils \
    libipc \
    libnotify \
    syslink_trace_daemon.out \
    librcm \
    libsysmgr \
    syslink_daemon.out \
    dmm_daemontest.out \
    event_listener.out \
    interm3.out \
    gateMPApp.out \
    heapBufMPApp.out \
    heapMemMPApp.out \
    listMPApp.out \
    messageQApp.out \
    nameServerApp.out \
    sharedRegionApp.out \
    memmgrserver.out \
    notifyping.out \
    ducati_load.out \
    procMgrApp.out \
    slpmresources.out \
    slpmtransport.out \
    utilsApp.out \
    libd2cmap \
    libomap_mm_library_jni \
    libtimemmgr

# FM Radio
PRODUCT_PACKAGES += \
    Fmapplication \
    fmapp \
    libfm_stack \
    fmreceiverif \
    com.ti.fm.fmreceiverif.xml \
    FmRxService \
    libfmrx


#FRAMEWORKS_BASE_SUBDIRS += \
#	$(addsuffix /java, omapmmlib )

PRODUCT_PACKAGES += \
    libskiahwdec \
    libskiahwenc

PRODUCT_PACKAGES += \
    libstagefrighthw

# Charger mode
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# F2FS filesystem
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# artas182x (Artur Załęski) part
PRODUCT_PACKAGES += \
WFD \
Mira4U
#$(LOCAL_PATH)/fs/system/bin/wfd:system/bin/wfd \
#$(LOCAL_PATH)/fs/system/bin/udptest:system/bin/udptest \
#$(LOCAL_PATH)/fs/system/bin/rtptest:system/bin/rtptest \
#$(LOCAL_PATH)/fs/system/bin/nettest:system/bin/nettest \

PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/fs/system/media/bootanimation.zip:system/media/bootanimation.zip \
$(LOCAL_PATH)/fs/system/etc/init.d/55frandom:system/etc/init.d/55frandom \
$(LOCAL_PATH)/fs/system/bin/fstrim:system/bin/fstrim \
$(LOCAL_PATH)/fs/system/app/GPSFixer.apk:system/app/GPSFixer.apk \
$(LOCAL_PATH)/fs/system/app/L9UMSSwitcher.apk:system/app/L9UMSSwitcher.apk \
$(LOCAL_PATH)/fs/system/app/L9Tweaker.apk:system/app/L9Tweaker.apk \
$(LOCAL_PATH)/fs/system/app/OTAUpdater.apk:system/app/OTAUpdater.apk \
$(LOCAL_PATH)/fs/system/app/L9BM.apk:system/app/L9BM.apk \
$(LOCAL_PATH)/fs/system/framework/com.android.location.provider.jar:system/framework/com.android.location.provider.jar

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
$(call inherit-product, vendor/lge/u2/u2-vendor.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/Android.mk)
# $(call inherit-product, frameworks/av/media/libstagefright/wifi-display/Android.mk)

DEVICE_RESOLUTION := 540x960
HAVE_SELINUX := true
TW_EXTERNAL_STORAGE_PATH := "/storage/sdcard0"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_FLASH_FROM_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_MAX_BRIGHTNESS := 255
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/omap/omap_i2c.2/i2c-2/2-0036/brightness


PRODUCT_PROPERTY_OVERRIDES += \
rild.libpath=/system/lib/lge-ril.so \
ro.telephony.ril_class=U2RIL \
wifi.interface=wlan0 \
ro.bq.gpu_to_cpu_unsupported=1 \
ro.hwui.disable_scissor_opt=true \
dalvik.vm.dexopt-flags=m=y,u=n \
persist.dalvik.vm.dexopt-data-only=0 \
ro.sf.lcd_density=240 \
ro.opengles.version=131072 \
dalvik.vm.dexopt-data-only=1 \
ro.com.google.clientidbase=android-lge \
ro.com.google.clientidbase.ms=android-lge \
ro.com.google.clientidbase.gmm=android-lge \
ro.com.google.clientidbase.yt=android-lge \
ro.com.google.clientidbase.am=android-lge \
omap.audio.mic.main=AMic0 \
omap.audio.mic.sub=AMic1 \
omap.audio.power=PingPong \
ro.build.target_country=EU \
ro.build.target_operator=OPEN \
ro.bt.bdaddr_path=/sys/devices/platform/bd_address/bdaddr_if \
persist.sys.usb.config=mtp,adb \
persist.debug.wfd.enable=1 \
windowsmgr.max_events_per_sec=50 \
otaupdater.otaid=l9cm11artas182x \
otaupdater.otaver=1 \
otaupdater.otatime=20140710-2149


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
