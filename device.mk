LOCAL_PATH := device/samsung/j1mini3g

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/j1mini3g/j1mini3g-vendor.mk)

# Overlays
PRODUCT_PACKAGE_OVERLAYS += device/samsung/j1mini3g/overlay

# Sprd proprietaries drm libomx
$(call inherit-product, vendor/sprd/proprietaries/proprietaries-scx35l.mk)

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)


# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.fw.dex2oat_thread_count=4 \
	dalvik.vm.dex2oat-flags=--no-watch-dog

# Audio configuration
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/audio_hw.xml:system/etc/audio_hw.xml \
	$(LOCAL_PATH)/audio/audio_para:system/etc/audio_para \
	$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/audio/codec_pga.xml:system/etc/codec_pga.xml \
	$(LOCAL_PATH)/audio/tiny_hw.xml:system/etc/tiny_hw.xml

PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default

# BT configuration
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	$(LOCAL_PATH)/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	$(LOCAL_PATH)/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
	$(LOCAL_PATH)/bluetooth/iop_bt.db:system/etc/bluetooth/iop_bt.db \
	$(LOCAL_PATH)/bluetooth/iop_device_list.conf:system/etc/bluetooth/iop_device_list.conf

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Camera
PRODUCT_PACKAGES += \
	Snap

# Charger
PRODUCT_PACKAGES += \
	charger_res_images

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Filesystem
PRODUCT_PACKAGES += \
	fsck.f2fs \
	f2fstat \
	fibmap.f2fs \
	mkfs.f2fs \
	setup_fs

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl \
	$(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

# Media configs
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.sc8830 \
	init.board.rc \
	init.sc8830.rc \
	init.sc8830.usb.rc \
	init.wifi.rc \
	ueventd.sc8830.rc \
	init.rc \
	init.gps.rc


# Spreadtrum-specific
PRODUCT_PACKAGES += \
	power.sc8830 \
	lights.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
	gralloc.sc8830 \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_mp3dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_soft_h264dec \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_sprd_vpxdec \
	libstagefright_soft_imaadpcmdec \
	libstagefright_soft_mjpgdec \
	audio.primary.sc8830 \
	libatchannel \
	audio_policy.sc8830 \
	iwnpi \
	cp_diskserver \
	radvd \
	download \
	wcnd \
	wcnd_cli \
	hcidump \
	libbt-vendor \
	librilutils

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sdcardfs.enable=true

# Telephony
PRODUCT_PACKAGES += \
	libxml2 \
	Stk \
	libril_shim \
	libstlport

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1 \
	persist.sys.usb.config=mtp

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Wi-Fi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd \
	wpa_supplicant

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0