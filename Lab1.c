#include <stdio.h>
#define N 6
#define M 5

void func(int n, int m, int arr[M][N], int* num, int* cnt) {
    for (int rp = 0; rp < m; rp++) {
        for (int re = 0; re < n; re++) {
            if (arr[rp][re] > * num) {
                *cnt += 1;
            }
        }
    }
}

int main(int argc, char** argv)
{
    int a[M][N];
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &a[i][j]);
        }
    }
    int num;
    scanf("%d", &num);
    int cnt = 0;
    func(6, 5, a, &num, &cnt);
    printf("%d", cnt);
    return 0;
}
