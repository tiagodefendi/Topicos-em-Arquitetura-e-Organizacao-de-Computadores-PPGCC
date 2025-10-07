// =================================================================
//      VERSÃO MÍNIMA DO 'ATAX' PARA ANÁLISE DE COMPILAÇÃO
// =================================================================

// 1. Definições de tipo e tamanho
#define NX 40
#define NY 40
#define DATA_TYPE double

// 2. O kernel computacional principal (do atax.c)
// Realiza a operação y = A_transpose * A * x
static void kernel_atax(int m, int n,
                        DATA_TYPE A[NX][NY],
                        DATA_TYPE x[NY],
                        DATA_TYPE y[NX],
                        DATA_TYPE tmp[NY])
{
    int i, j;

    for (i = 0; i < n; i++)
        y[i] = 0;

    for (i = 0; i < m; i++)
    {
        tmp[i] = 0.0;
        for (j = 0; j < n; j++)
            tmp[i] = tmp[i] + A[i][j] * x[j];
        for (j = 0; j < n; j++)
            y[j] = y[j] + A[i][j] * tmp[i];
    }
}

// 3. Arrays globais e uma função `main` para chamar o kernel.
DATA_TYPE A[NX][NY];
DATA_TYPE x[NY];
DATA_TYPE y[NX];
DATA_TYPE tmp[NY];

int main()
{
    // A inicialização dos dados não é necessária para a análise de assembly.
    // Apenas chamamos o kernel para que o compilador gere o código para ele.
    kernel_atax(NX, NY, A, x, y, tmp);

    // Usamos o resultado para evitar que o compilador otimize e remova a chamada.
    return (int)y[0] + (int)tmp[0];
}
