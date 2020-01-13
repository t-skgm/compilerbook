.intel_syntax noprefix
.global main

main:
    ; > 関数からリターンしたときにRAXに入っている値が関数の返り値という約束になっている
    mov rax, 42
    ; return
    ; Cではmain関数が返した値はプログラム全体としての終了コードになります
    ret
