#
# Copyright (C) 2017 The LineageOS Project
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

LOCAL_PATH := device/huawei/cherryplus

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_GPU := mali-450mp

TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true

TARGET_BOARD_PLATFORM := hi6210sft
BOARD_VENDOR_PLATFORM := hi6210sft

ENABLE_CPUSETS := true

# Assert
TARGET_OTA_ASSERT_DEVICE := hi6210sft,cherryplus,Che2-L11,hwChe2,cherry

# Don't generate block mode update zips
#BLOCK_BASED_OTA := false

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi6210sft
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(LOCAL_PATH)/bluetooth/vnd_hi6210sft.txt

# Camera
USE_CAMERA_STUB := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY := true
BACKLIGHT_PATH := "/sys/class/leds/lcd_backlight0/brightness"

# CMHW
BOARD_HARDWARE_CLASS := \
    $(LOCAL_PATH)/cmhw \
    hardware/cyanogen/cmhw

# Display
USE_OPENGL_RENDERER := true
TARGET_HARDWARE_3D := true
TARGET_USE_PAN_DISPLAY := true
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
ANDROID_ENABLE_RENDERSCRIPT := true
TARGET_USES_ION := true
BOARD_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
BOARD_NO_SUPPORT_SWAP_BUFFERS_WITH_DAMAGE := true
BOARD_DONT_USE_NATIVE_FENCE_SYNC := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 6
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
#BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# For TEST
# Non PIE Support to run GPS
TARGET_NEEDS_NON_PIE_SUPPORT := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x07478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := hisi_dma_print=0 vmalloc=384M maxcpus=8 coherent_pool=512K no_irq_affinity ate_enable=true androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x02988000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/huawei/shine
TARGET_KERNEL_CONFIG := cherryplus_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2550136832
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4064280576
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.hi6210sft
TARGET_RECOVERY_DEVICE_MODULES := libinit_hi6210sft
BOARD_USES_FULL_RECOVERY_IMAGE := true

# RIL
#HISI_RIL := true
ifeq ($(HISI_RIL),true)
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
PROTOBUF_SUPPORTED := true
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/hisi_ril
else
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/huawei_ril
endif
SIM_COUNT := 2

# Enable WEBGL
ENABLE_WEBGL := true

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_hi6210sft
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_cherryplus.cpp

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER  := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

WIFI_DRIVER_FW_PATH_AP    := "/vendor/firmware/fw_bcm4343s_apsta_hw.bin"
WIFI_DRIVER_FW_PATH_STA   := "/vendor/firmware/fw_bcm4343s_hw.bin"
WIFI_DRIVER_FW_PATH_P2P   := "/vendor/firmware/fw_bcm4343s_p2p_hw.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG    := "firmware_path=/vendor/firmware/fw_bcm4343s_hw.bin nvram_path=/vendor/firmware/nvram_CHERRY_PLUS_ED00.txt"

# TWRP
RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TWHAVE_SELINUX := true
TW_BRIGHTNESS_PATH := "/sys/devices/platform/balong_fb.1/leds/lcd_backlight0/brightness"
TW_CUSTOM_BATTERY_PATH := "/sys/devices/battery.0/power_supply/Battery"
TW_MAX_BRIGHTNESS := 255
BOARD_HAS_NO_SELECT_BUTTON := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXCLUDE_SUPERSU := true
TW_FBIOPAN := true
TW_DEFAULT_LANGUAGE := ru

# Paths
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# USB Mounting
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

WITH_DEXPREOPT := true
#DONT_DEXPREOPT_PREBUILTS := true
SHOW_COMMANDS := true
