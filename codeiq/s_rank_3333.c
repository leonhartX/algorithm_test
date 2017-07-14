#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
int solve(int** arr, int sz) {
   int** dp = malloc(sizeof(int *) * sz);
    for(int i = 0; i < sz; i++) {
        dp[i] = malloc(sizeof(int) * sz);
        for(int j = 0; j < sz; j++) {
            dp[i][j] = 1;
        }
    }
    int max = 0;
    int min = 0;
  
    for(int y = 1; y < sz; y++) {
        for(int x = 1; x < sz; x++) {
            if ((arr[y-1][x-1] != arr[y][x]) ||
                (arr[y-1][x] != arr[y][x]) ||
                (arr[y][x-1] != arr[y][x])) {
                    continue;
            } else if ((dp[y-1][x] >= dp[y-1][x-1]) && (dp[y][x-1] >= dp[y-1][x-1])) {
                dp[y][x] = dp[y-1][x-1] + 1;
            } else {
                min = dp[y-1][x] > dp[y][x-1] ? dp[y][x-1] : dp[y-1][x];
                dp[y][x] = min + 1;
            }
            if (dp[y][x] > max) {
                max = dp[y][x];
            }
        }
    }
    /*
    for (int i = 0; i < sz; i++) {
        for(int j = 0; j < sz; j++) {
            printf("%d",arr[i][j]);
        }
        printf("\n");
    }
    printf("----------------------\n");
    for (int i = 0; i < sz; i++) {
        for(int j = 0; j < sz; j++) {
            printf("%02d,",dp[i][j]);
        }
        printf("\n");
    }
    */

    for(int i = 0; i < sz; i++) {
        free(dp[i]);
    }
    free(dp);
    return max * max;
}

void gen(int** arr, int sz, int h) {
    int r = 1;
    int r0,r1,r2,r3,r4;
    int sqrX, sqrY, sqrH, sqrW, brdH;
    int max = sz < 100 ? sz : 100;
    for (int i = 0; i < max; i++) {
        r0 = r = (r % 10009) * 99991;
        r1 = r = (r % 10009) * 99991;
        r2 = r = (r % 10009) * 99991;
        r3 = r = (r % 10009) * 99991;
        r4 = r = (r % 10009) * 99991;

        sqrX = r0 % sz;
        sqrY = r1 % sz;
        sqrW = r2 % (sz - sqrX) % 100;
        sqrH = r3 % (sz - sqrY) % 100;
        brdH = (r4 % h) + 1;

        for (int x = sqrX; x < sqrX + sqrW; x ++) {
            for (int y = sqrY; y < sqrY + sqrH; y ++) {
                arr[(x + y * sz) / sz][(x + y * sz) % sz] = brdH;
            }
        }
  }
  return;
}

int main(){
    int sz = 0, h = 0;
    int res;
    for(; ~scanf("%d,%d", &sz, &h);){
        int** arr = malloc(sizeof(int *) * sz);
        for(int i = 0; i < sz; i++) {
            arr[i] = malloc(sizeof(int) * sz);
            for(int j = 0; j < sz; j++) {
                arr[i][j] = 1;
            }
        }
        gen(arr, sz, h);
        res = solve(arr, sz);
        printf("%d\n", res);
        for(int i = 0; i < sz; i++) {
            free(arr[i]);
        }
        free(arr);
    }
    return 0;
}


