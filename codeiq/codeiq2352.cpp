#define _CRT_SECURE_NO_WARNINGS
#include "stdio.h"
#include "math.h"

int main(int argc, char* argv[])
{
    long double a = 0.0;
    scanf("%Lf", &a);
    long double b, frac;
    long double min_frac = 1.0;
    int p;
    int min_p, min_q;
    int i = 0;
    for (i = 1; i < 999999; i++)
    {
        b = a * i;
        p = (int)b;
        if (p > 999999)
        {
            continue;
        }
        frac = b - p;
        if (frac < min_frac)
        {
            min_p = p;
            min_q = i;
            min_frac = frac;
        }
        if ((1 - frac) < min_frac)
        {
            min_p = p + 1;
            min_q = i;
            min_frac = 1 - frac;
        }
    }
    printf("%d %d\n", min_p, min_q);
    
    return 0;
}