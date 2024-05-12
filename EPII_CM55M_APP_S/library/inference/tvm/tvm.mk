# directory declaration
LIB_INFERENCE_ENGINE_DIR = $(LIBRARIES_ROOT)/inference/tvm
LIB_INFERENCE_ENGINE_DEFINES = 
# LIB_INFERENCE_ENGINE_ASMSRCDIR
# use for information only rules.mk - ALL_ASMSRC_DIRS
LIB_INFERENCE_ENGINE_ASMSRCDIR	= $(LIB_INFERENCE_ENGINE_DIR)
LIB_INFERENCE_ENGINE_CSRCDIR	= $(LIB_INFERENCE_ENGINE_DIR) 
LIB_INFERENCE_ENGINE_CXXSRCSDIR    = $(LIB_INFERENCE_ENGINE_DIR)

# LIB_INFERENCE_ENGINE_INCDIR (needed) used in files.mk - INCS_DIR 
# add into ALL_INCLUDES = $(foreach dir,$(ALL_INC_DIRS),-I$(dir)) in rules.mk
# INCS_DIR		= $(OS_INCDIR) $(BOARD_INCDIR) $(LIB_INCDIR) $(BOARD_INC_DIR) $(DEVICE_INC_DIR) $(DRIVERS_INCDIR) $(EXTERNAL_INCDIR) $(LIB_BSS_DATA_INCDIR) \
				$(TRUSTZONE_SEC_INC_DIR) $(TRUSTZONE_CFG_INC_DIR) $(NSC_INC_DIR) $(MID_INCDIR) $(LIB_INFERENCE_ENGINE_INCDIR) $(LIB_AUDIOALGO_INCDIR) $(HWACCAUTOTEST_INCDIR)\
				$(SCENARIO_APP_INCDIR) $(LINKER_INC_DIR) 
LIB_INFERENCE_ENGINE_INCDIR	= $(LIB_INFERENCE_ENGINE_DIR) $(LIB_INFERENCE_ENGINE_DIR)/runtime/include
LIB_INFERENCE_ENGINE_INCDIR  += $(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/include
LIB_INFERENCE_ENGINE_INCDIR  += $(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/include

LIB_INFERENCE_ENGINE_INCDIR  += $(LIB_INFERENCE_ENGINE_DIR)/third_party/flatbuffers/include \
				$(LIB_INFERENCE_ENGINE_DIR)/third_party \
				$(LIB_INFERENCE_ENGINE_DIR)/third_party/ethos_u_core_driver/include \
				$(LIB_INFERENCE_ENGINE_DIR)/third_party/gemmlowp \
				$(LIB_INFERENCE_ENGINE_DIR)/third_party/ruy \
				$(LIB_INFERENCE_ENGINE_DIR)/codegen/host/include
# find all the source files in the target directories
#LIB_INFERENCE_ENGINE_CSRCS = $(call get_csrcs, $(LIB_INFERENCE_ENGINE_CSRCDIR))
# LIB_INFERENCE_ENGINE_CSRCS = $(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/c/common.c
LIB_INFERENCE_ENGINE_CSRCS = 

LIB_INFERENCE_ENGINE_CSRCS += \
$(LIB_INFERENCE_ENGINE_DIR)/third_party/ethos_u_core_driver/src/ethosu_pmu.c \
$(LIB_INFERENCE_ENGINE_DIR)/third_party/ethos_u_core_driver/src/ethosu_driver.c \
$(LIB_INFERENCE_ENGINE_DIR)/third_party/ethos_u_core_driver/src/ethosu_device_u55_u65.c \
$(LIB_INFERENCE_ENGINE_DIR)/codegen/host/src/default_lib0.c \
$(LIB_INFERENCE_ENGINE_DIR)/codegen/host/src/default_lib1.c \
$(LIB_INFERENCE_ENGINE_DIR)/codegen/host/src/default_lib2.c \
$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/aot_executor/aot_executor.c \
$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/memory/stack_allocator.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/aot_executor_module/aot_executor_module.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/common/crt_backend_api.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/common/crt_runtime_api.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/common/func_registry.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/common/ndarray.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/common/packed_func.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/graph_executor/graph_executor.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/graph_executor/load_json.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/graph_executor_module/graph_executor_module.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/memory/page_allocator.c \
#$(LIB_INFERENCE_ENGINE_DIR)/runtime/src/runtime/crt/microtvm_rpc_common/crcccitt.c \


#LIB_INFERENCE_ENGINE_CXXSRCS = $(call get_cxxsrcs, $(LIB_INFERENCE_ENGINE_CXXSRCSDIR))
# $(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/micro/cortex_m_corstone_300/system_setup.cc
# $(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/micro/system_setup.cc 

LIB_INFERENCE_ENGINE_CXXSRCS = \
#$(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/c/common.cc \

ifeq ($(LIB_CMSIS_NN_ENALBE), 1)
LIB_INFERENCE_ENGINE_CXXSRCS += \
#$(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/micro/kernels/cmsis_nn/add.cc \


LIB_INFERENCE_ENGINE_DEFINES += -DCMSIS_NN

else
#if not use cmsis nn, unmask the function below and mask cmsis nn related information 
LIB_INFERENCE_ENGINE_CXXSRCS +=  \
#$(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/micro/kernels/add.cc \

endif
#$(LIB_INFERENCE_ENGINE_DIR)//home/bigcat-himax/code_we2/ntflm_1101/tensorflow/lite/micro/tools/make/downloads/ethos_u_core_platform/targets/corstone-300/retarget.c \
$(LIB_INFERENCE_ENGINE_DIR)//home/bigcat-himax/code_we2/ntflm_1101/tensorflow/lite/micro/tools/make/downloads/ethos_u_core_platform/targets/corstone-300/uart.c \
$(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/micro/tools/make/downloads/cmsis/Device/ARM/ARMCM55/Source/system_ARMCM55.c \
$(LIB_INFERENCE_ENGINE_DIR)/tensorflow/lite/micro/tools/make/downloads/cmsis/Device/ARM/ARMCM55/Source/startup_ARMCM55.c

#LIB_INFERENCE_ENGINE_ASMSRCS = $(call get_asmsrcs, $(LIB_INFERENCE_ENGINE_ASMSRCDIR))
LIB_INFERENCE_ENGINE_ASMSRCS = 

#needed by elf build
# get object files, needed by files.mk
LIB_INFERENCE_ENGINE_COBJS = $(call get_relobjs, $(LIB_INFERENCE_ENGINE_CSRCS))
LIB_INFERENCE_ENGINE_CXXOBJS = $(call get_relobjs, $(LIB_INFERENCE_ENGINE_CXXSRCS))
LIB_INFERENCE_ENGINE_ASMOBJS = $(call get_relobjs, $(LIB_INFERENCE_ENGINE_ASMSRCS))


LIB_INFERENCE_ENGINE_OBJS = $(LIB_INFERENCE_ENGINE_COBJS) $(LIB_INFERENCE_ENGINE_ASMOBJS) $(LIB_INFERENCE_ENGINE_CXXOBJS)

# get dependency files
LIB_INFERENCE_ENGINE_DEPS = $(call get_deps, $(LIB_INFERENCE_ENGINE_OBJS))

# extra macros to be defined
LIB_INFERENCE_ENGINE_DEFINES +=  -DTF_LITE_STATIC_MEMORY -DTF_LITE_MCU_DEBUG_LOG  
LIB_INFERENCE_ENGINE_DEFINES += -DETHOSU_ARCH=u55 -DETHOSU55 -DETHOSU_LOG_SEVERITY=ETHOSU_LOG_WARN -DETHOS_U

# genearte library
ifeq ($(LIB_CMSIS_NN_ENALBE), 1)
INFERENCE_ENGINE_LIB_NAME = libtflmtag2209_u55tag2205_cmsisnn_$(TOOLCHAIN).a
lib_sel += cmsis_nn
else
INFERENCE_ENGINE_LIB_NAME = libtflmtag2209_u55tag2205_$(TOOLCHAIN).a
endif

# Middleware Definitions
INFERENCE_ENGINE_LIB_CSRCDIR += $(LIB_INFERENCE_ENGINE_CSRCDIR)
INFERENCE_ENGINE_LIB_CXXSRCDIR += $(LIB_INFERENCE_ENGINE_CXXSRCDIR)
INFERENCE_ENGINE_LIB_ASMSRCDIR += $(LIB_INFERENCE_ENGINE_ASMSRCDIR)

# definition only exist in inference_engine 
#INFERENCE_ENGINE_LIB_CSRCS += $(LIB_INFERENCE_ENGINE_CSRCS)
#INFERENCE_ENGINE_LIB_CXXSRCS += $(LIB_INFERENCE_ENGINE_CXXSRCS)
#INFERENCE_ENGINE_LIB_ASMSRCS += $(LIB_INFERENCE_ENGINE_ASMSRCS)
#INFERENCE_ENGINE_LIB_ALLSRCS += $(LIB_INFERENCE_ENGINE_CSRCS) $(LIB_INFERENCE_ENGINE_ASMSRCS)


INFERENCE_ENGINE_LIB_COBJS += $(LIB_INFERENCE_ENGINE_COBJS)
INFERENCE_ENGINE_LIB_CXXOBJS += $(LIB_INFERENCE_ENGINE_CXXOBJS)
INFERENCE_ENGINE_LIB_ASMOBJS += $(LIB_INFERENCE_ENGINE_ASMOBJS)
INFERENCE_ENGINE_LIB_ALLOBJS += $(LIB_INFERENCE_ENGINE_OBJS)

LIB_DEFINES += $(LIB_INFERENCE_ENGINE_DEFINES)
LIB_DEPS += $(LIB_INFERENCE_ENGINE_DEPS)
# INFERENCE_ENGINE_LIB_LIBS += $(LIB_LIB_INFERENCE_ENGINE)

# library generation rule
ifeq ($(INFERENCE_FORCE_PREBUILT), y)
override LIB_INFERENCE_ENGINE_OBJS:=
endif

INFERENCE_ENGINE_LIB := $(subst /,$(PS), $(strip $(OUT_DIR)/$(INFERENCE_ENGINE_LIB_NAME)))

# library generation rule
$(INFERENCE_ENGINE_LIB): $(LIB_INFERENCE_ENGINE_OBJS)
	$(TRACE_ARCHIVE)
ifeq "$(strip $(LIB_INFERENCE_ENGINE_OBJS))" ""
	$(CP) $(PREBUILT_LIB)$(INFERENCE_ENGINE_LIB_NAME) $(INFERENCE_ENGINE_LIB)
else
	$(Q)$(AR) $(AR_OPT) $@ $(LIB_INFERENCE_ENGINE_OBJS)
	$(CP) $(INFERENCE_ENGINE_LIB) $(PREBUILT_LIB)$(INFERENCE_ENGINE_LIB_NAME)
endif

