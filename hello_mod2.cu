%%cu
#include <stdio.h>
#include <cuda.h>

__global__ void hello()
{
   int globalID = blockIdx.x * blockDim.x + threadIdx.x; // Calcula el ID global del hilo
   if(globalID == 2047) // Sólo el último hilo imprime el mensaje especial
     printf("Hello world from thread %d of block %d. Soy Fredy y mi carnet es 201011\n", threadIdx.x, blockIdx.x);
   else
     printf("Hello world from thread %d of block %d\n", threadIdx.x, blockIdx.x);
}

int main()
{
  hello<<<2,1024>>>(); // 2 bloques, 1024 hilos por bloque
  cudaDeviceSynchronize();
  return 0;
}

