# Compile the kernel inline

# Note for this to work you will need to remove prebuilt kernel building in device tree,
# and any other inline kernel building implementations.

# Original Author Jameson Williams jameson.h.williams@intel.com

# Modified for SaberMod

# Kernel binary prefix.  The other part of this will go in the kernel source's Makefile.
# And also in defconfigs (arch/arm/configs/name_defconfig)(or arm64) CONFIG_CROSS_COMPILE="arm-eabi-" (or "aarch64-")
ifeq ($(strip $(LOCAL_ARCH)),arm)
export CROSS_COMPILE_NAME := arm-linux-gnueabi-
endif

ifeq ($(strip $(LOCAL_ARCH)),arm64)
export CROSS_COMPILE_NAME := aarch64-linux-gnu-
endif

ifneq ($(filter %sirius,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter cm% candy5% pa%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cm_shinano_sirius_defconfig
  endif
  ifneq ($(filter slim%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := slim_shinano_sirius_defconfig
  endif
endif

ifneq ($(filter %z3,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/sony/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter cm% candy5% pa%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cm_shinano_leo_defconfig
  endif
  ifneq ($(filter slim%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := slim_shinano_leo_defconfig
  endif
endif

ifneq ($(filter %awifi,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/lge/awifi
  KERNEL_BINARY_IMAGE := zImage
  ifneq ($(filter cm%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_awifi_defconfig
  endif
endif

ifdef KERNEL_DIR
  include $(KERNEL_DIR)/AndroidKernel.mk
endif

# cp will do.
.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel
