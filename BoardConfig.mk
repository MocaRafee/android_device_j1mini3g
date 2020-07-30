# inherit from the proprietary version
-include vendor/samsung/j1mini3g/BoardConfigVendor.mk

# Arch
COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := SC7227SE
BOARD_VENDOR := samsung

# Audio
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_ALSA_AUDIO := false
BUILD_WITH_ALSA_UTILS := false
BOARD_AUDIO_OLD_MODEM := false

# Bluetooth
USE_BLUETOOTH_BCM4343 := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_SPRD := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/j1mini3g/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/j1mini3g/bluetooth/libbt_vndcfg.txt
SPRD_WCNBT_CHISET := marlin
BOARD_SPRD_WCNBT_MARLIN := true
SPRD_CP_LOG_WCN := MARLIN
WCN_EXTENSION := true

# Build.prop
TARGET_SYSTEM_PROP := device/samsung/j1mini3g/system.prop

# Camera
USE_CAMERA_STUB := true

# Charger
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_NO_CHARGER_LED := true
HAVE_KEYBOARD_BACKLIGHT := false
BOARD_CHARGING_MODE_BOOTING_LPM := "/sys/class/power_supply/battery/batt_lp_charging"
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
DEVICE_RESOLUTION := 480x800
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Codecs
COMMON_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ device/samsung/j1mini3g/cmhw

# DRM
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# Enable dex-preoptimization to speed up the first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_ONLY := true
WITH_DEXPREOPT_PIC := true
WITH_DEXPREOPT_COMP := false

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5046586573
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USE_EMMC := true

# Graphics
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
HWUI_COMPILE_FOR_PERF := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# HWComposer
BOARD_NEEDS_MEMORYHEAPION_SPRD := true
USE_SPRD_HWCOMPOSER := true
USE_SPRD_DITHER := true
USE_OVERLAY_COMPOSER_GPU := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Keys
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/j1mini3g/recovery/recovery_keys.c
BOARD_HAS_NO_SELECT_BUTTON := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/j1mini3g
TARGET_KERNEL_CONFIG := lineage_j1mini3g-OC_defconfig
TARGET_KERNEL_HAVE_EXFAT := true
NEED_KERNEL_MODULE_ROOT := true
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --cmdline 'console=ttyS1,115200n8'
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/j1mini3g/bootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
TARGET_CUSTOM_DTBTOOL := dtbToolSprd

SPRD_MODULES:
	make -C vendor/sprd/modules/libgpu/gpu/utgard/ MALI_PLATFORM=sc8830 BUILD=debug KDIR=$(KERNEL_OUT) clean
	make -C vendor/sprd/modules/libgpu/gpu/utgard/ MALI_PLATFORM=sc8830 BUILD=debug KDIR=$(KERNEL_OUT)
	mv vendor/sprd/modules/libgpu/gpu/utgard/mali.ko $(KERNEL_MODULES_OUT)
	make -C vendor/sprd/wcn/wifi/sc2331/6.0/ SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=debug KDIR=$(KERNEL_OUT) clean
	make -C vendor/sprd/wcn/wifi/sc2331/6.0/ SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=debug KDIR=$(KERNEL_OUT)
	mv vendor/sprd/wcn/wifi/sc2331/6.0/sprdwl.ko $(KERNEL_MODULES_OUT)
	mkdir -p $(PRODUCT_OUT)/system/lib/modules
	ln -sf /lib/modules/mali.ko $(PRODUCT_OUT)/system/lib/modules/mali.ko
	ln -sf /lib/modules/sprdwl.ko $(PRODUCT_OUT)/system/lib/modules/sprdwl.ko

TARGET_KERNEL_MODULES := SPRD_MODULES
TARGET_IGNORE_RO_BOOT_REVISION := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# OTA package configuration
BLOCK_BASED_OTA := false
TARGET_OTA_ASSERT_DEVICE := j1mini3g,SM-J105H

# Power
BOARD_POWERHINT_HAL := interactive
PATH_WHITELIST_EXTRA_H := "/sys/devices/sec-battery.4/power_supply/battery/batt_lp_charging"

# Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/20200000.usb/gadget/lun%d/file"

# SELinux
BOARD_SEPOLICY_DIRS += \
	device/samsung/j1mini3g/sepolicy

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Telephony
BOARD_PROVIDES_RILD := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Use dmalloc() for such low memory devices like us
MALLOC_IMPL := dlmalloc
BOARD_USES_LEGACY_MMAP := true

# WEBGL
ENABLE_WEBGL := true

# WIFI configs
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_sprdwl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_sprdwl
BOARD_WLAN_DEVICE           := sc2341
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/fwpath"
WIFI_DRIVER_FW_PATH_STA     := "sta_mode"
WIFI_DRIVER_FW_PATH_P2P     := "p2p_mode"
WIFI_DRIVER_FW_PATH_AP      := "ap_mode"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/sprdwl.ko"
WIFI_DRIVER_MODULE_NAME     := "sprdwl"