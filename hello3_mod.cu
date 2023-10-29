%%cu
/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Last modified : December 2014
 License       : Released under the GNU GPL 3.0
 Description   :
 To build use  : nvcc hello2.cu -o hello2 -arch=sm_20
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello ()
{
  // Fórmula genérica para calcular el ID global
  int myID = ( blockIdx.z * gridDim.x * gridDim.y  +
               blockIdx.y * gridDim.x +
               blockIdx.x ) * blockDim.x * blockDim.y * blockDim.z +
               threadIdx.z *  blockDim.x * blockDim.y +
               threadIdx.y * blockDim.x +
               threadIdx.x;

  printf ("Hello world from %i. [Fredy 201011]\n", myID); // Modificación aquí para agregar nombre y carné
}

int main ()
{
  dim3 g (4, 2);      // Modificación aquí
  dim3 b (32, 16);    // Modificación aquí

  hello <<< g, b >>> ();
  cudaDeviceSynchronize();  // Usando cudaDeviceSynchronize ya que cudaThreadSynchronize está obsoleto
  return 0;
}
