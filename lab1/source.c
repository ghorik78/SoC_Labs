#include <stdio.h>

#define N 6
#define M 5

void process(int n, int m, int k, int matrix[M][N], int *result)
{
    *result = 0;

    for (int i = 0; i < n; ++i) {
        *result += matrix[k][i];
    }
}

int main(int argc, char **argv)
{
    int matrix[M][N];
    int result;
    int k;
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    scanf("%d", &k);

    process(N, M, k, matrix, &result);
    printf("%d\n", result);

    return 0;
}
