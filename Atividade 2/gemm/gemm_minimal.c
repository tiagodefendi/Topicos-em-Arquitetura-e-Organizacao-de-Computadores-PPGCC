// =================================================================
//      VERSÃO MÍNIMA DO 'GEMM' PARA ANÁLISE NO COMPILER EXPLORER
// =================================================================

// 1. Definições de tipo e tamanho (do gemm.h e polybench.h)
#define NI 40
#define NJ 40
#define NK 40
#define DATA_TYPE double

// 2. O kernel computacional principal (do gemm.c)
static void kernel_gemm(int ni, int nj, int nk,
                        DATA_TYPE alpha,
                        DATA_TYPE beta,
                        DATA_TYPE C[NI][NJ],
                        DATA_TYPE A[NI][NK],
                        DATA_TYPE B[NK][NJ])
{
    int i, j, k;

    // A lógica de cálculo: C = beta*C + alpha*A*B
    #pragma scop
    for (i = 0; i < ni; i++) {
        for (j = 0; j < nj; j++) {
            C[i][j] *= beta;
            for (k = 0; k < nk; k++) {
                C[i][j] += alpha * A[i][k] * B[k][j];
            }
        }
    }
    #pragma endscop
}

// 3. Arrays globais e uma função `main` para chamar o kernel.
DATA_TYPE C[NI][NJ];
DATA_TYPE A[NI][NK];
DATA_TYPE B[NK][NJ];

int main() {
    DATA_TYPE alpha = 1.5;
    DATA_TYPE beta = 1.2;
    kernel_gemm(NI, NJ, NK, alpha, beta, C, A, B);
    return (int)C[0][0];
}
