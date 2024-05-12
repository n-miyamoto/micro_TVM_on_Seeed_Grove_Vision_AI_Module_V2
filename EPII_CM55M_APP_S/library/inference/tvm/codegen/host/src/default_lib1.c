// tvm target: c -keys=arm_cpu,cpu -mcpu=cortex-m55
#define TVM_EXPORTS
#include "tvm/runtime/c_runtime_api.h"
#include "tvm/runtime/c_backend_api.h"
#include <math.h>
#include <tvm_ethosu_runtime.h>
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t TVMDeviceEthosUActivate(void* device_context_ethos_u);
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t TVMDeviceEthosUOpen(void* device_context_ethos_u);
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t tvmgen_default_tvmgen_default_ethos_u_main_0(uint8_t* input_buffer_var, int8_t* sid_1_let, uint8_t* global_workspace_0_var, void* device_context_ethos_u);
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t TVMDeviceEthosUClose(void* device_context_ethos_u);
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t TVMDeviceEthosUDeactivate(void* device_context_ethos_u);
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t tvmgen_default_fused_nn_softmax_divide_round_clip_cast(float* p0, uint8_t* T_cast, uint8_t* global_workspace_3_var) {
  void* T_softmax_maxelem_let = (&(global_workspace_3_var[8032]));
  ((float*)T_softmax_maxelem_let)[0] = -3.402823e+38f;
  for (int32_t k = 0; k < 1001; ++k) {
    float __1 = ((float*)T_softmax_maxelem_let)[0];
    float __2 = p0[k];
    ((float*)T_softmax_maxelem_let)[0] = ((__1) > (__2) ? (__1) : (__2));
  }
  void* T_softmax_exp_let = (&(global_workspace_3_var[0]));
  for (int32_t i1 = 0; i1 < 1001; ++i1) {
    ((float*)T_softmax_exp_let)[i1] = expf((p0[i1] - ((float*)T_softmax_maxelem_let)[0]));
  }
  void* T_softmax_expsum_let = (&(global_workspace_3_var[8032]));
  ((float*)T_softmax_expsum_let)[0] = 0.000000e+00f;
  for (int32_t k_1 = 0; k_1 < 1001; ++k_1) {
    ((float*)T_softmax_expsum_let)[0] = (((float*)T_softmax_expsum_let)[0] + ((float*)T_softmax_exp_let)[k_1]);
  }
  void* T_softmax_norm_let = (&(global_workspace_3_var[4016]));
  for (int32_t i1_1 = 0; i1_1 < 1001; ++i1_1) {
    ((float*)T_softmax_norm_let)[i1_1] = (((float*)T_softmax_exp_let)[i1_1] / ((float*)T_softmax_expsum_let)[0]);
  }
  for (int32_t ax1 = 0; ax1 < 1001; ++ax1) {
    float __3 = roundf((((float*)T_softmax_norm_let)[ax1] * 2.560000e+02f));
    float __4 = (__3) < (2.550000e+02f) ? (__3) : (2.550000e+02f);
    T_cast[ax1] = ((uint8_t)((__4) > (0.000000e+00f) ? (__4) : (0.000000e+00f)));
  }
  return 0;
}

#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t tvmgen_default_fused_reshape_cast_subtract_cast_multiply(uint8_t* p0, float* T_multiply, uint8_t* global_workspace_2_var) {
  for (int32_t ax1_outer = 0; ax1_outer < 251; ++ax1_outer) {
    for (int32_t ax1_inner = 0; ax1_inner < 4; ++ax1_inner) {
      if (((ax1_outer * 4) + ax1_inner) < 1001) {
        int32_t cse_var_1 = ((ax1_outer * 4) + ax1_inner);
        T_multiply[cse_var_1] = (((float)(((int32_t)p0[cse_var_1]) - 66)) * 1.660992e-01f);
      }
    }
  }
  return 0;
}

#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t tvmgen_default___tvm_main__(uint8_t* input_buffer_var, uint8_t* MobilenetV1_Predictions_Reshape_1_buffer_var, uint8_t* global_workspace_0_var, void* device_context_ethos_u) {
  if (TVMDeviceEthosUActivate(device_context_ethos_u) != 0 ) return -1;
  void* sid_1_let = (&(global_workspace_0_var[825872]));
  void* sid_2_let = (&(global_workspace_0_var[4016]));
  if (TVMDeviceEthosUOpen(device_context_ethos_u) != 0 ) return -1;
  if (tvmgen_default_tvmgen_default_ethos_u_main_0(input_buffer_var, sid_1_let, global_workspace_0_var, device_context_ethos_u) != 0 ) return -1;
  if (TVMDeviceEthosUClose(device_context_ethos_u) != 0 ) return -1;
  if (tvmgen_default_fused_reshape_cast_subtract_cast_multiply(sid_1_let, sid_2_let, global_workspace_0_var) != 0 ) return -1;
  if (tvmgen_default_fused_nn_softmax_divide_round_clip_cast(sid_2_let, MobilenetV1_Predictions_Reshape_1_buffer_var, global_workspace_0_var) != 0 ) return -1;
  if (TVMDeviceEthosUDeactivate(device_context_ethos_u) != 0 ) return -1;
  return 0;
}

