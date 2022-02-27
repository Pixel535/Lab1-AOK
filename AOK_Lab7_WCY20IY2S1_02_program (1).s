.data

TA:		.space 520
TB:		.space 480
rozmiar_TA:	.word 130
rozmiar_TB:	.word 120
Suma:		.double 0
l_pocz: 	.word 2002

.text

lw r10, l_pocz
lw r2, Suma
addi r31, r0, 800
addi r15, r0, TA
addi r20, r0, #130
addi r25, r0, TB
addi r30, r0, #120

Tab_TA:

sw 0(r15), r10
addi r15, r15, #4
subi r20, r20, 1
add r10, r10, 1
bnez r20, Tab_TA

addi r16, r0, TA+24
addi r17, r0, TA+8
addi r18, r0, TA+4

Tab_TB:

lw r26, 0(r16)
lw r27, 0(r17)
lw r28, 0(r18)
add r11, r26, r27
sub r12, r11, r28
mult r13, r12, r31
sw 0(r25), r13
add r2, r2, r13
addi r16, r16, #4
addi r17, r17, #4
addi r18, r18, #4
addi r25, r25, #4
subi r30, r30, 1
bnez r30, Tab_TB

movi2fp f2, r2
cvti2d f8, f2
sd Suma, f8

trap 0