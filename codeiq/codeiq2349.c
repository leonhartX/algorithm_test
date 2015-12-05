#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[])
{
	int n = 0;
    scanf("%d", &n);
    int* dp;
    dp = malloc(n * sizeof(int));
    dp[0] = 0;
    dp[1] = 0;
    dp[2] = 1;
    int i = 0;
    for (i = 3; i <= n; i++)
    {
    	dp[i] = dp[i - 1] + 1;
    	if (i % 2 == 0)
    	{
    		dp[i] = dp[i / 2] < dp[i] ? dp[i / 2] + 1 : dp[i];
    	}
    }
    printf("%d\n", dp[n]);
    return 0;
}