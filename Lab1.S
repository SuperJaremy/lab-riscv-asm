.data
N:
.word 6
M:
.word 5
matrix:
.word 1,1,1,1,1,1
.word 2,2,2,2,2,2
.word 3,3,3,3,3,3
.word 4,4,4,4,4,4
.word 5,5,5,5,5,5
number:
.word -3
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
la a6, number
call func
lw a1, result
li a0, 1
ecall
li a0, 10
ecall

func:
lw t1, 0(a2)
lw t2, 0(a3)
lw t5, 0(a6)
li t4,0

init:
li t3,0

loop:
lw t6,0(a4)
addi a4,a4,4
bge t6,t5,test

cnt:
addi t3,t3,1
blt t3, t1, loop
addi t4, t4, 1
blt t4, t2, init
ret

test:
beq t6, t5, cnt
lw t0, 0(a5)
addi t0, t0, 1
sw t0, 0(a5)
j cnt