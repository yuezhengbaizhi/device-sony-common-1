# EGL libs

include $(CLEAR_VARS)
LOCAL_MODULE := adreno_symlinks

TARGET_DIRECTORY := $(PRODUCT_OUT)/$(TARGET_COPY_OUT_VENDOR)

LIBRARY_NAMES := \
    egl \
    libC2D2.so \
    libCB.so \
    libOpenCL.so \
    libRSDriver_adreno.so \
    libadreno_utils.so \
    libc2d30-a3xx.so \
    libc2d30-a4xx.so \
    libc2d30-a5xx.so \
    libc2d30_bltlib.so \
    libgsl.so \
    libllvm-glnext.so \
    libllvm-qcom.so \
    libllvm-qgl.so \
    libmm-qdcm.so \
    librs_adreno.so \
    librs_adreno_sha1.so \
    hw/vulkan.$(TARGET_BOARD_PLATFORM).so

# Create target directories
CREATE_FOLDERS := lib/hw lib64/hw
LOCAL_POST_INSTALL_CMD += mkdir -p $(foreach p,$(CREATE_FOLDERS),$(TARGET_DIRECTORY)/$p);

# Create symlinks to 32- and 64-bit directories:
LOCAL_POST_INSTALL_CMD += $(foreach lib_dir,lib lib64,\
    $(foreach p,$(LIBRARY_NAMES),\
        ln -sf /odm/$(lib_dir)/$p $(TARGET_DIRECTORY)/$(lib_dir)/$(dir $p); \
    ) \
)

# include $(BUILD_SYSTEM)/base_rules.mk
include $(BUILD_PHONY_PACKAGE)
