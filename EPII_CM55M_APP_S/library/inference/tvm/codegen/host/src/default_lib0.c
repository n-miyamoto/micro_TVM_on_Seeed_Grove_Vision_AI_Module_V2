#include "tvm/runtime/c_runtime_api.h"
#ifdef __cplusplus
extern "C" {
#endif
__attribute__((section(".bss.noinit.tvm"), aligned(16)))
static uint8_t global_workspace[1206880];
#include <tvmgen_default.h>
TVM_DLL int32_t tvmgen_default___tvm_main__(void* input,void* output0,uint8_t* global_workspace_0_var,void* ethos_u);
int32_t tvmgen_default_run(struct tvmgen_default_inputs* inputs,struct tvmgen_default_outputs* outputs,struct tvmgen_default_devices* devices) {return tvmgen_default___tvm_main__(inputs->input,outputs->MobilenetV1_Predictions_Reshape_1,&global_workspace,devices->ethos_u);
}
#ifdef __cplusplus
}
#endif
;