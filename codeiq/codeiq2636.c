#include <stdio.h>

#define N 12 /* キーの数を定義 */

int memo[1 << N] = {0}; /* 一度探索したものを記録 */

/*
 * 配置が何通りあるかを探索
 * used: 使用済みの位置をビット列で表現
 * n: 使用済みの個数を保持
 */
int search(int used, int n){
    if (n == N) return 1; /* すべて配置したら完了 */
    if (memo[used] > 0) return memo[used];
    int count = 0;
    int i;
    for (i = 0; i < N; i++){
        /* まだ配置しておらず、元の位置と異なるときは配置して次を探索 */
        if (((used & (1 << i)) == 0) && (i != n)){
            count += search(used | (1 << i), n + 1);
        }
    }
    /* 探索したものを記録 */
    memo[used] = count;

    /* 何通りの配置があるかを返す */
    return count;
}

int main(void) {
    /* 探索して結果を出力 */
    printf("%d\n", search(0, 0));
    return 0;
}
