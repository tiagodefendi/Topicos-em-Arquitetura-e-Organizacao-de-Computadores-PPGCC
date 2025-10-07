// =================================================================
//      VERSÃO MÍNIMA DO 'FDTD-2D' PARA ANÁLISE DE COMPILAÇÃO
// =================================================================

// 1. Definições de tipo e tamanho
#define TMAX 20
#define NX 40
#define NY 40
#define DATA_TYPE double

// 2. O kernel computacional principal (do fdtd-2d.c)
// Simula a propagação de ondas 2D ao longo do tempo.
static void kernel_fdtd_2d(int tmax,
                           int nx, int ny,
                           DATA_TYPE ex[NX][NY],
                           DATA_TYPE ey[NX][NY],
                           DATA_TYPE hz[NX][NY],
                           DATA_TYPE _fict_[TMAX])
{
    int t, i, j;

    for (t = 0; t < tmax; t++)
    {
        for (j = 0; j < ny; j++)
            ey[0][j] = _fict_[t];
        for (i = 1; i < nx; i++)
            for (j = 0; j < ny; j++)
                ey[i][j] = ey[i][j] - 0.5 * (hz[i][j] - hz[i - 1][j]);
        for (i = 0; i < nx; i++)
            for (j = 1; j < ny; j++)
                ex[i][j] = ex[i][j] - 0.5 * (hz[i][j] - hz[i][j - 1]);
        for (i = 0; i < nx - 1; i++)
            for (j = 0; j < ny - 1; j++)
                hz[i][j] = hz[i][j] - 0.7 * (ex[i][j + 1] - ex[i][j] + ey[i + 1][j] - ey[i][j]);
    }
}

// 3. Arrays globais e uma função `main` para chamar o kernel.
DATA_TYPE ex[NX][NY];
DATA_TYPE ey[NX][NY];
DATA_TYPE hz[NX][NY];
DATA_TYPE _fict_[TMAX];

int main()
{
    // A inicialização dos dados não é necessária para a análise de assembly.
    // Apenas chamamos o kernel para que o compilador gere o código para ele.
    kernel_fdtd_2d(TMAX, NX, NY, ex, ey, hz, _fict_);

    // Usamos o resultado para evitar que o compilador otimize e remova a chamada.
    return (int)hz[0][0];
}
