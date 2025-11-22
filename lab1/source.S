.data
N:
    .word 6
M:
    .word 5
K:
    .word 5

matrix:
    .word 1, 1, 1, 1, 1, 1
    .word 2, 2, 2, 2, 2, 2
    .word 3, 3, 3, 3, 3, 3
    .word 4, 4, 4, 4, 4, 4
    .word 5, 5, 5, 5, 5, 5
result:
    .word 0

.text
la a2, N
la a3, M
la a4, K
la a5, matrix
la a6, result
call process
la a2, result
call print
call exit

print:
    lw   t1, 0(a2)
    addi a0, x0, 1  # print_int ecal
    addi a1, t1, 0
    ecall

    addi a0, x0, 11 # print_char ecall
    addi a1, x0, 10
    ecall

    ret

exit:
    addi a0, x0, 10
    ecall

process:
    lw t1, 0(a2) # N
    lw t2, 0(a3) # M
    lw t3, 0(a4) # K

init:
    addi t5, x0, 0  # result to save
    mul  t4, t1, t3
    li   t3, 4
    mul  t4, t4, t3
    add  a4, a4, t4
    addi a4, a4, 4
    addi t4, x0, 0

cycle:
    lw   t6, 0(a4)    # load value from array
    addi a4, a4, 4  # increment array pointer
    add  t5, t5, t6 # count sum
    addi t4, t4, 1
    blt  t4, t2, cycle
    sw   t5, 0(a6)
    ret
