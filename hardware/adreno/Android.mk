# EGL libs

include $(SONY_CLEAR_VARS)
LOCAL_MODULE := adreno_symlinks

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

# Create symlinks to 32- and 64-bit directories:
SONY_SYMLINKS := $(foreach lib_dir,lib lib64,\
    $(foreach p,$(LIBRARY_NAMES),\
        /odm/$(lib_dir)/$p:$(TARGET_COPY_OUT_VENDOR)/$(lib_dir)/$p \
    ) \
)

include $(SONY_BUILD_SYMLINKS)
