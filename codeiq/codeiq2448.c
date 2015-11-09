#define _CRT_SECURE_NO_DEPRECATE 0
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char *argv[])
{
    char buffer[80];
    /* 標準入力の内容を標準出力に返します。ここから */
    scanf("%80s", buffer);
    printf("Hello ");
    printf("%s", buffer);
    /* ここまでを安全なコードに書き換えてください */
    return 0;
}