#ifndef TVMGEN_DEFAULT_H_
#define TVMGEN_DEFAULT_H_
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/*!
 * \brief Input tensor input size (in bytes) for TVM module "default" 
 */
#define TVMGEN_DEFAULT_INPUT_SIZE -1582571184
/*!
 * \brief Output tensor MobilenetV1_Predictions_Reshape_1 size (in bytes) for TVM module "default" 
 */
#define TVMGEN_DEFAULT_MOBILENETV1_PREDICTIONS_RESHAPE_1_SIZE -1597178032
/*!
 * \brief Input tensor pointers for TVM module "default" 
 */
struct tvmgen_default_inputs {
  void* input;
};

/*!
 * \brief Output tensor pointers for TVM module "default" 
 */
struct tvmgen_default_outputs {
  void* MobilenetV1_Predictions_Reshape_1;
    void* output;
};

/*!
 * \brief Device context pointers for TVM module "default" 
 */
struct tvmgen_default_devices {
  void* ethos_u;
};

/*!
 * \brief entrypoint function for TVM module "default"
 * \param inputs Input tensors for the module 
 * \param outputs Output tensors for the module 
 * \param devices Device context pointers for the module 
 */
int32_t tvmgen_default_run(
  struct tvmgen_default_inputs* inputs,
  struct tvmgen_default_outputs* outputs,
  struct tvmgen_default_devices* devices
);
/*!
 * \brief Workspace size for TVM module "default" 
 */
#define TVMGEN_DEFAULT_WORKSPACE_SIZE 1206880

#ifdef __cplusplus
}
#endif

#endif // TVMGEN_DEFAULT_H_
