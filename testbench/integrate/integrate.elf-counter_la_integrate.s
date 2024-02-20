	.file	"counter_la_integrate.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/Desktop/lab-wlos_baseline_1/testbench/integrate" "counter_la_integrate.c"
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 1 "../../firmware/stub.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	.loc 1 20 2
	.loc 1 20 5 is_stmt 0
	li	a5,10
	beq	a0,a5,.L8
.L2:
	.loc 1 22 13 discriminator 1
	li	a4,-268410880
	.loc 1 22 60 discriminator 1
	li	a3,1
.L4:
	.loc 1 22 60 is_stmt 1 discriminator 1
	.loc 1 22 13 is_stmt 0 discriminator 1
	lw	a5,-2044(a4)
	.loc 1 22 60 discriminator 1
	beq	a5,a3,.L4
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	sw	a0,-2048(a4)
	.loc 1 24 1
	ret
.L8:
.LBB16:
.LBB17:
	.loc 1 22 13
	li	a4,-268410880
	.loc 1 22 60
	li	a3,1
.L3:
	.loc 1 22 60 is_stmt 1
	.loc 1 22 13 is_stmt 0
	lw	a5,-2044(a4)
	.loc 1 22 60
	beq	a5,a3,.L3
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	li	a5,13
	sw	a5,-2048(a4)
	.loc 1 24 1
	j	.L2
.LBE17:
.LBE16:
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 1 27 1 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 28 2
	.loc 1 28 9
	lbu	a2,0(a0)
	beq	a2,zero,.L9
.LBB22:
.LBB23:
	.loc 1 20 5 is_stmt 0
	li	a1,10
.LBB24:
.LBB25:
	.loc 1 22 13
	li	a4,-268410880
	.loc 1 22 60
	li	a3,1
	.loc 1 23 50
	li	a6,13
.L14:
.LBE25:
.LBE24:
.LBE23:
.LBE22:
	.loc 1 29 3 is_stmt 1
	.loc 1 29 14 is_stmt 0
	addi	a0,a0,1
.LVL2:
.LBB30:
.LBB28:
	.loc 1 20 2 is_stmt 1
	.loc 1 20 5 is_stmt 0
	beq	a2,a1,.L12
.L13:
	.loc 1 22 60 is_stmt 1
	.loc 1 22 13 is_stmt 0
	lw	a5,-2044(a4)
	.loc 1 22 60
	beq	a5,a3,.L13
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	sw	a2,-2048(a4)
.LVL3:
.LBE28:
.LBE30:
	.loc 1 28 9 is_stmt 1
	lbu	a2,0(a0)
	bne	a2,zero,.L14
.L9:
	.loc 1 30 1 is_stmt 0
	ret
.LVL4:
.L12:
.LBB31:
.LBB29:
.LBB27:
.LBB26:
	.loc 1 22 60 is_stmt 1
	.loc 1 22 13 is_stmt 0
	lw	a5,-2044(a4)
	.loc 1 22 60
	beq	a5,a3,.L12
	.loc 1 23 2 is_stmt 1
	.loc 1 23 50 is_stmt 0
	sw	a6,-2048(a4)
	.loc 1 24 1
	j	.L13
.LBE26:
.LBE27:
.LBE29:
.LBE31:
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB323:
	.file 2 "counter_la_integrate.c"
	.loc 2 62 1 is_stmt 1
	.cfi_startproc
	.loc 2 64 5
	.loc 2 67 2
	.loc 2 95 6
	.loc 2 62 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 2 95 54
	li	a2,1
	.loc 2 97 43
	li	a3,8192
	.loc 2 95 54
	li	a4,-268419072
	.loc 2 97 43
	li	a5,637534208
	.loc 2 95 54
	sw	a2,-2048(a4)
	.loc 2 97 9 is_stmt 1
	.loc 2 97 43 is_stmt 0
	addi	a4,a3,-2039
	sw	a4,160(a5)
	.loc 2 98 9 is_stmt 1
	.loc 2 98 43 is_stmt 0
	sw	a4,156(a5)
	.loc 2 99 9 is_stmt 1
	.loc 2 99 43 is_stmt 0
	sw	a4,152(a5)
	.loc 2 100 9 is_stmt 1
	.loc 2 100 43 is_stmt 0
	sw	a4,148(a5)
	.loc 2 101 9 is_stmt 1
	.loc 2 101 43 is_stmt 0
	sw	a4,144(a5)
	.loc 2 102 9 is_stmt 1
	.loc 2 102 43 is_stmt 0
	sw	a4,140(a5)
	.loc 2 103 9 is_stmt 1
	.loc 2 103 43 is_stmt 0
	sw	a4,136(a5)
	.loc 2 104 9 is_stmt 1
	.loc 2 104 43 is_stmt 0
	sw	a4,132(a5)
	.loc 2 105 9 is_stmt 1
	.loc 2 105 43 is_stmt 0
	sw	a4,128(a5)
	.loc 2 106 9 is_stmt 1
	.loc 2 106 43 is_stmt 0
	sw	a4,124(a5)
	.loc 2 107 9 is_stmt 1
	.loc 2 107 43 is_stmt 0
	sw	a4,120(a5)
	.loc 2 108 9 is_stmt 1
	.loc 2 108 43 is_stmt 0
	sw	a4,116(a5)
	.loc 2 109 9 is_stmt 1
	.loc 2 109 43 is_stmt 0
	sw	a4,112(a5)
	.loc 2 110 9 is_stmt 1
	.loc 2 110 43 is_stmt 0
	sw	a4,108(a5)
	.loc 2 111 9 is_stmt 1
	.loc 2 111 43 is_stmt 0
	sw	a4,104(a5)
	.loc 2 112 9 is_stmt 1
	.loc 2 112 43 is_stmt 0
	sw	a4,100(a5)
	.loc 2 114 6 is_stmt 1
	.loc 2 114 40 is_stmt 0
	sw	a4,96(a5)
	.loc 2 115 6 is_stmt 1
	.loc 2 115 40 is_stmt 0
	sw	a4,92(a5)
	.loc 2 116 6 is_stmt 1
	.loc 2 116 40 is_stmt 0
	sw	a4,88(a5)
	.loc 2 117 6 is_stmt 1
	.loc 2 117 40 is_stmt 0
	sw	a4,84(a5)
	.loc 2 118 6 is_stmt 1
	.loc 2 118 40 is_stmt 0
	sw	a4,80(a5)
	.loc 2 119 6 is_stmt 1
	.loc 2 119 40 is_stmt 0
	sw	a4,76(a5)
	.loc 2 120 6 is_stmt 1
	.loc 2 120 40 is_stmt 0
	sw	a4,72(a5)
	.loc 2 121 6 is_stmt 1
	.loc 2 121 40 is_stmt 0
	sw	a4,68(a5)
	.loc 2 122 6 is_stmt 1
	.loc 2 122 40 is_stmt 0
	sw	a4,64(a5)
	.loc 2 123 6 is_stmt 1
	.loc 2 123 40 is_stmt 0
	sw	a4,52(a5)
	.loc 2 124 6 is_stmt 1
	.loc 2 124 40 is_stmt 0
	sw	a4,48(a5)
	.loc 2 125 6 is_stmt 1
	.loc 2 125 40 is_stmt 0
	sw	a4,44(a5)
	.loc 2 126 6 is_stmt 1
	.loc 2 126 40 is_stmt 0
	sw	a4,40(a5)
	.loc 2 127 6 is_stmt 1
	.loc 2 129 40 is_stmt 0
	addi	a3,a3,-2040
	.loc 2 127 40
	sw	a4,36(a5)
	.loc 2 129 6 is_stmt 1
	.loc 2 129 40 is_stmt 0
	sw	a3,60(a5)
	.loc 2 130 6 is_stmt 1
	.loc 2 130 40 is_stmt 0
	li	a4,1026
	sw	a4,56(a5)
	.loc 2 136 2 is_stmt 1
	.loc 2 136 50 is_stmt 0
	li	a4,-268410880
	sw	a2,0(a4)
	.loc 2 139 2 is_stmt 1
	.loc 2 139 36 is_stmt 0
	sw	a2,0(a5)
	.loc 2 140 2 is_stmt 1
	.loc 2 140 10 is_stmt 0
	li	s0,637534208
	.loc 2 140 43
	li	a4,1
.L22:
	.loc 2 140 43 is_stmt 1 discriminator 1
	.loc 2 140 10 is_stmt 0 discriminator 1
	lw	a5,0(s0)
	.loc 2 140 43 discriminator 1
	beq	a5,a4,.L22
	.loc 2 144 2 is_stmt 1
	.loc 2 144 114 is_stmt 0
	li	a5,-268423168
	sw	zero,12(a5)
	.loc 2 144 57
	sw	zero,28(a5)
	.loc 2 145 2 is_stmt 1
	.loc 2 145 112 is_stmt 0
	li	a3,-1
	sw	a3,8(a5)
	.loc 2 145 56
	sw	a3,24(a5)
	.loc 2 146 2 is_stmt 1
	.loc 2 146 112 is_stmt 0
	sw	zero,4(a5)
	.loc 2 146 56
	sw	zero,20(a5)
	.loc 2 147 2 is_stmt 1
	.loc 2 147 100 is_stmt 0
	sw	zero,0(a5)
	.loc 2 147 50
	sw	zero,16(a5)
	.loc 2 150 2 is_stmt 1
	.loc 2 150 36 is_stmt 0
	li	a3,-1421869056
	sw	a3,12(s0)
	.loc 2 153 2 is_stmt 1
	.loc 2 153 56 is_stmt 0
	sw	zero,56(a5)
	.loc 2 156 2 is_stmt 1
	.loc 2 156 112 is_stmt 0
	sw	zero,8(a5)
	.loc 2 156 56
	sw	zero,24(a5)
	.loc 2 160 2 is_stmt 1
.LBB32:
.LBB33:
	.file 3 "../../firmware/irq_vex.h"
	.loc 3 24 2
	.loc 3 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a5, 3008
# 0 "" 2
.LVL5:
	.loc 3 26 2
 #NO_APP
.LBE33:
.LBE32:
	.loc 2 161 2
	.loc 2 162 2
.LBB34:
.LBB35:
	.loc 3 31 2
	ori	a5,a5,4
.LVL6:
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a5
# 0 "" 2
.LVL7:
 #NO_APP
.LBE35:
.LBE34:
	.loc 2 164 2
.LBB36:
	.file 4 "../../firmware/csr.h"
	.loc 4 806 2
.LBB37:
.LBB38:
	.file 5 "../../firmware/hw/common.h"
	.loc 5 34 2
	.loc 5 34 32 is_stmt 0
	li	a5,-268406784
.LVL8:
	sw	a4,-2028(a5)
.LVL9:
.LBE38:
.LBE37:
.LBE36:
	.loc 2 168 2 is_stmt 1
	.loc 2 168 14 is_stmt 0
	call	matmul
.LVL10:
	.loc 2 169 2 is_stmt 1
	.loc 2 169 44 is_stmt 0
	lw	a5,0(a0)
	.loc 2 170 48
	lw	a2,4(a0)
	.loc 2 171 48
	lw	a3,8(a0)
	.loc 2 172 48
	lw	a4,12(a0)
	.loc 2 169 44
	slli	a5,a5,16
	.loc 2 169 36
	sw	a5,12(s0)
	.loc 2 170 2 is_stmt 1
	.loc 2 170 48 is_stmt 0
	slli	a2,a2,16
	.loc 2 174 48
	lw	a5,36(a0)
	.loc 2 171 48
	slli	a3,a3,16
	.loc 2 170 36
	sw	a2,12(s0)
	.loc 2 171 2 is_stmt 1
	.loc 2 171 36 is_stmt 0
	sw	a3,12(s0)
	.loc 2 172 2 is_stmt 1
	.loc 2 172 48 is_stmt 0
	slli	a4,a4,16
	.loc 2 172 36
	sw	a4,12(s0)
	.loc 2 174 2 is_stmt 1
	.loc 2 174 48 is_stmt 0
	slli	a5,a5,16
	.loc 2 174 36
	sw	a5,12(s0)
	.loc 2 176 2 is_stmt 1
	.loc 2 176 36 is_stmt 0
	li	a5,-1420754944
	sw	a5,12(s0)
	.loc 2 179 2 is_stmt 1
	.loc 2 179 14 is_stmt 0
	call	qsort
.LVL11:
	.loc 2 180 2 is_stmt 1
	.loc 2 180 44 is_stmt 0
	lw	a4,0(a0)
	.loc 2 181 48
	lw	a5,4(a0)
	.loc 2 182 48
	lw	a2,8(a0)
	.loc 2 183 48
	lw	a3,12(a0)
	.loc 2 180 44
	slli	a4,a4,16
	.loc 2 180 36
	sw	a4,12(s0)
	.loc 2 181 2 is_stmt 1
	.loc 2 181 48 is_stmt 0
	slli	a5,a5,16
	.loc 2 184 48
	lw	a4,16(a0)
	.loc 2 182 48
	slli	a2,a2,16
	.loc 2 181 36
	sw	a5,12(s0)
	.loc 2 182 2 is_stmt 1
	.loc 2 185 48 is_stmt 0
	lw	a5,20(a0)
	.loc 2 183 48
	slli	a3,a3,16
	.loc 2 182 36
	sw	a2,12(s0)
	.loc 2 183 2 is_stmt 1
	.loc 2 186 48 is_stmt 0
	lw	a2,24(a0)
	.loc 2 184 48
	slli	a4,a4,16
	.loc 2 183 36
	sw	a3,12(s0)
	.loc 2 184 2 is_stmt 1
	.loc 2 187 48 is_stmt 0
	lw	a3,28(a0)
	.loc 2 185 48
	slli	a5,a5,16
	.loc 2 184 36
	sw	a4,12(s0)
	.loc 2 185 2 is_stmt 1
	.loc 2 188 48 is_stmt 0
	lw	a4,32(a0)
	.loc 2 186 48
	slli	a2,a2,16
	.loc 2 185 36
	sw	a5,12(s0)
	.loc 2 186 2 is_stmt 1
	.loc 2 189 48 is_stmt 0
	lw	a5,36(a0)
	.loc 2 187 48
	slli	a3,a3,16
	.loc 2 186 36
	sw	a2,12(s0)
	.loc 2 187 2 is_stmt 1
	.loc 2 187 36 is_stmt 0
	sw	a3,12(s0)
	.loc 2 188 2 is_stmt 1
	.loc 2 188 48 is_stmt 0
	slli	a4,a4,16
	.loc 2 188 36
	sw	a4,12(s0)
	.loc 2 189 2 is_stmt 1
	.loc 2 189 48 is_stmt 0
	slli	a5,a5,16
	.loc 2 189 36
	sw	a5,12(s0)
	.loc 2 191 2 is_stmt 1
	.loc 2 191 36 is_stmt 0
	li	a5,-1420689408
	sw	a5,12(s0)
	.loc 2 208 2 is_stmt 1
	call	initfir
.LVL12:
	.loc 2 210 2
	.loc 2 211 2
.LBB39:
	.loc 2 211 7
	.loc 2 211 20
	li	a5,889196544
.LBE39:
	.loc 2 208 2 is_stmt 0
	li	a4,889196544
.LBB40:
	.loc 2 215 5
	li	a1,16773120
.LBE40:
	.loc 2 208 2
	addi	a4,a4,-1024
.LBB41:
	.loc 2 215 5
	addi	a1,a1,1088
	.loc 2 211 20
	addi	a0,a5,-980
.LVL13:
.L23:
	.loc 2 213 3 is_stmt 1 discriminator 3
	.loc 2 213 8 is_stmt 0 discriminator 3
	lw	a2,0(a4)
.LVL14:
	.loc 2 215 3 is_stmt 1 discriminator 3
	.loc 2 215 5 is_stmt 0 discriminator 3
	add	a3,a4,a1
	.loc 2 211 20 discriminator 3
	addi	a4,a4,4
	.loc 2 215 51 discriminator 3
	sw	a2,0(a3)
	.loc 2 211 27 is_stmt 1 discriminator 3
	.loc 2 211 20 discriminator 3
	bne	a4,a0,.L23
.LBE41:
	.loc 2 218 2
	.loc 2 218 36 is_stmt 0
	li	a3,1
	li	a4,905969664
	sw	a3,0(a4)
	.loc 2 220 2 is_stmt 1
	.loc 2 221 2
.LBB42:
	.loc 2 221 7
.LVL15:
	.loc 2 221 20
	li	a3,889196544
.LBE42:
	.loc 2 218 36 is_stmt 0
	addi	a5,a5,-960
.LBB43:
	.loc 2 225 38
	li	a2,905969664
.LVL16:
	.loc 2 221 20
	addi	a3,a3,-704
.LVL17:
.L24:
	.loc 2 223 3 is_stmt 1 discriminator 3
	.loc 2 223 5 is_stmt 0 discriminator 3
	lw	a4,0(a5)
.LVL18:
	.loc 2 225 3 is_stmt 1 discriminator 3
	.loc 2 221 20 is_stmt 0 discriminator 3
	addi	a5,a5,4
	.loc 2 225 38 discriminator 3
	sw	a4,128(a2)
	.loc 2 221 27 is_stmt 1 discriminator 3
	.loc 2 221 20 discriminator 3
	bne	a5,a3,.L24
.LBE43:
	.loc 2 229 2
	.loc 2 230 2
	.loc 2 230 4 is_stmt 0
	lw	a4,132(a2)
.LVL19:
	.loc 2 231 2 is_stmt 1
	.loc 2 231 5 is_stmt 0
	li	a5,12288
	addi	a5,a5,-1491
	bne	a4,a5,.L25
	.loc 2 232 3 is_stmt 1
	.loc 2 232 37 is_stmt 0
	li	a5,637534208
	li	a4,765853696
.LVL20:
	sw	a4,12(a5)
.LVL21:
.L25:
	.loc 2 236 2 is_stmt 1
	.loc 2 239 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.loc 2 236 36
	li	a5,637534208
	li	a4,-1420623872
	sw	a4,12(a5)
	.loc 2 239 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	main, .-main
	.text
.Letext0:
	.file 6 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2f2
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xf
	.4byte	.LASF22
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL18
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x10
	.4byte	.LASF23
	.byte	0x6
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x12
	.4byte	.LASF24
	.byte	0x2
	.byte	0x2f
	.byte	0xd
	.4byte	0x86
	.byte	0x5
	.byte	0
	.byte	0x9
	.4byte	.LASF11
	.byte	0x31
	.4byte	0x96
	.4byte	0x96
	.byte	0x5
	.byte	0
	.byte	0xa
	.4byte	0x6a
	.byte	0x9
	.4byte	.LASF12
	.byte	0x30
	.4byte	0x96
	.4byte	0xab
	.byte	0x5
	.byte	0
	.byte	0x13
	.4byte	.LASF25
	.byte	0x2
	.byte	0x3d
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x1de
	.byte	0x3
	.4byte	.LASF13
	.byte	0x40
	.byte	0x9
	.4byte	0x6a
	.4byte	.LLST4
	.byte	0x14
	.string	"j"
	.byte	0x2
	.byte	0x43
	.byte	0x6
	.4byte	0x6a
	.byte	0x3
	.4byte	.LASF14
	.byte	0xa8
	.byte	0x7
	.4byte	0x96
	.4byte	.LLST5
	.byte	0x3
	.4byte	.LASF15
	.byte	0xb3
	.byte	0x7
	.4byte	0x96
	.4byte	.LLST6
	.byte	0x3
	.4byte	.LASF16
	.byte	0xd2
	.byte	0xb
	.4byte	0x50
	.4byte	.LLST7
	.byte	0x4
	.string	"x"
	.byte	0xdc
	.4byte	0x50
	.4byte	.LLST8
	.byte	0x4
	.string	"y"
	.byte	0xe5
	.4byte	0x50
	.4byte	.LLST9
	.byte	0xb
	.4byte	.LLRL14
	.4byte	0x135
	.byte	0x4
	.string	"i"
	.byte	0xd3
	.4byte	0x6a
	.4byte	.LLST15
	.byte	0
	.byte	0xb
	.4byte	.LLRL16
	.4byte	0x14b
	.byte	0x4
	.string	"i"
	.byte	0xdd
	.4byte	0x6a
	.4byte	.LLST17
	.byte	0
	.byte	0x6
	.4byte	0x1f6
	.4byte	.LBB32
	.4byte	.LBE32-.LBB32
	.byte	0xa0
	.byte	0x9
	.4byte	0x164
	.byte	0x15
	.4byte	0x207
	.byte	0
	.byte	0x6
	.4byte	0x1de
	.4byte	.LBB34
	.4byte	.LBE34-.LBB34
	.byte	0xa2
	.byte	0x2
	.4byte	0x181
	.byte	0x2
	.4byte	0x1e9
	.4byte	.LLST10
	.byte	0
	.byte	0x6
	.4byte	0x28e
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0xa4
	.byte	0x2
	.4byte	0x1c2
	.byte	0x2
	.4byte	0x29c
	.4byte	.LLST11
	.byte	0x16
	.4byte	0x2a8
	.4byte	.LBB37
	.4byte	.LBE37-.LBB37
	.byte	0x4
	.2byte	0x326
	.byte	0x2
	.byte	0x2
	.4byte	0x2bd
	.4byte	.LLST12
	.byte	0x2
	.4byte	0x2b3
	.4byte	.LLST11
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LVL10
	.4byte	0x9b
	.byte	0x7
	.4byte	.LVL11
	.4byte	0x86
	.byte	0x7
	.4byte	.LVL12
	.4byte	0x78
	.byte	0
	.byte	0xc
	.4byte	.LASF19
	.byte	0x3
	.byte	0x1d
	.4byte	0x1f6
	.byte	0x17
	.4byte	.LASF13
	.byte	0x3
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0
	.byte	0x18
	.4byte	.LASF26
	.byte	0x3
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.byte	0x3
	.4byte	0x214
	.byte	0x19
	.4byte	.LASF13
	.byte	0x3
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0
	.byte	0x1a
	.4byte	.LASF27
	.byte	0x1
	.byte	0x1a
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x265
	.byte	0x1b
	.string	"p"
	.byte	0x1
	.byte	0x1a
	.byte	0x18
	.4byte	0x265
	.4byte	.LLST0
	.byte	0xd
	.4byte	0x276
	.4byte	.LBB22
	.4byte	.LLRL1
	.byte	0x1d
	.byte	0x2
	.4byte	0x283
	.4byte	.LLST2
	.byte	0xd
	.4byte	0x276
	.4byte	.LBB24
	.4byte	.LLRL3
	.byte	0x15
	.byte	0xe
	.4byte	0x283
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0x271
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF17
	.byte	0x1c
	.4byte	0x26a
	.byte	0x1d
	.4byte	.LASF18
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.4byte	0x28e
	.byte	0x8
	.string	"c"
	.byte	0x1
	.byte	0x12
	.byte	0x13
	.4byte	0x26a
	.byte	0
	.byte	0x1e
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x325
	.byte	0x14
	.byte	0x3
	.4byte	0x2a8
	.byte	0x1f
	.string	"v"
	.byte	0x4
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0
	.byte	0xc
	.4byte	.LASF21
	.byte	0x5
	.byte	0x20
	.4byte	0x2c8
	.byte	0x8
	.string	"v"
	.byte	0x5
	.byte	0x20
	.byte	0x33
	.4byte	0x5c
	.byte	0x8
	.string	"a"
	.byte	0x5
	.byte	0x20
	.byte	0x44
	.4byte	0x5c
	.byte	0
	.byte	0x20
	.4byte	0x276
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.4byte	0x283
	.byte	0x1
	.byte	0x5a
	.byte	0x22
	.4byte	0x276
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x1
	.byte	0x15
	.byte	0x3
	.byte	0xe
	.4byte	0x283
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x2
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x14
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0x21
	.byte	0x3
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0x21
	.byte	0x3
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x2e
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST4:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL8
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11-1
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12-1
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL16
	.byte	0x1
	.byte	0x5c
	.byte	0
.LLST8:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL21
	.byte	0x3
	.byte	0x7c
	.byte	0x80,0x1
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL20
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL17
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL9
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL9
	.byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xf0006814
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LFE317
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LFE317
	.byte	0x1
	.byte	0x5c
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL1:
	.byte	0x6
	.4byte	.LBB22
	.4byte	.LBE22
	.byte	0x6
	.4byte	.LBB30
	.4byte	.LBE30
	.byte	0x6
	.4byte	.LBB31
	.4byte	.LBE31
	.byte	0
.LLRL3:
	.byte	0x6
	.4byte	.LBB24
	.4byte	.LBE24
	.byte	0x6
	.4byte	.LBB27
	.4byte	.LBE27
	.byte	0
.LLRL14:
	.byte	0x6
	.4byte	.LBB39
	.4byte	.LBE39
	.byte	0x6
	.4byte	.LBB40
	.4byte	.LBE40
	.byte	0x6
	.4byte	.LBB41
	.4byte	.LBE41
	.byte	0
.LLRL16:
	.byte	0x6
	.4byte	.LBB42
	.4byte	.LBE42
	.byte	0x6
	.4byte	.LBB43
	.4byte	.LBE43
	.byte	0
.LLRL18:
	.byte	0x6
	.4byte	.Ltext0
	.4byte	.Letext0
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"tap1"
.LASF24:
	.string	"initfir"
.LASF21:
	.string	"csr_write_simple"
.LASF14:
	.string	"tmp1"
.LASF15:
	.string	"tmp2"
.LASF12:
	.string	"matmul"
.LASF11:
	.string	"qsort"
.LASF22:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O2 -ffreestanding"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF18:
	.string	"putchar"
.LASF25:
	.string	"main"
.LASF26:
	.string	"irq_getmask"
.LASF19:
	.string	"irq_setmask"
.LASF10:
	.string	"unsigned int"
.LASF20:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"mask"
.LASF27:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF23:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF17:
	.string	"char"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/Desktop/lab-wlos_baseline_1/testbench/integrate"
.LASF0:
	.string	"counter_la_integrate.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
