#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "引数の個数が正しくありません\n");
    return 1;
  }

  // ex: 5+20-4
  char *p = argv[1];

  printf(".intel_syntax noprefix\n");
  printf(".global main\n");
  printf("main:\n");
  printf("  mov rax, %ld\n", strtol(p, &p, 10));

  // > 数字を読み込んだあとに、どこまで読み込んだのかがわからないといけません
  while (*p) {
    if (*p == '+') {
      p++;
      // > atoiでは読み込んだ文字の文字数は返してくれないので、atoiでは次の項をどこから読めばよいのかわからなくなってしまいます。
      // > したがってここでは、C標準ライブラリのstrtol関数を使いました。
      // 10進数で*p数値から数値を読み取ったあと、ポインタを進めている
      // %lf => long digit
      printf("  add rax, %ld\n", strtol(p, &p, 10));
      continue;
    }

    if (*p == '-') {
      p++;
      printf("  sub rax,   \n", strtol(p, &p, 10));
      continue;
    }

    fprintf(stderr, "予期しない文字です: '%c'\n", *p);
    return 1;
  }

  printf("  ret\n");
  return 0;
}
