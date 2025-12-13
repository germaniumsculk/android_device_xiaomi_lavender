common_deps :=
kernel_includes :=

ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
    common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
#   kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
# COMMENT OUT THE BAD LINE:
# kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

# ADD YOUR SHIM PATH INSTEAD:
kernel_includes += device/xiaomi/lavender/camera/include/media_shim
endif
