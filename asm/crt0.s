.include "asm/macros.inc"

.syntax unified
.arm
Init:
	b start_vector
	.include "asm/rom_header.inc"
	
start_vector:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _080000F8
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _080000F4
	ldr r1, _08000278
	add r0, pc, #0x18
	str r0, [r1]
	ldr r1, _0800027C
	mov lr, pc
	bx r1
	.byte 0xF2, 0xFF, 0xFF, 0xEA
_080000F4: .4byte gUnknown_03007E00
_080000F8: .4byte gUnknown_03007F80

	ARM_FUNC_START intr_main
intr_main: @ sub_80000FC
	mov ip, #0x4000000
	add r3, ip, #0x200
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	mov r2, #0
	ands r0, r1, #0x2000
	strbne r0, [r3, #-0x17c]
_08000118:
	bne _08000118
	add r2, r2, #4
	ands r0, r1, #1
	strhne r0, [ip, #-8]
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x80
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x40
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #2
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #4
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #8
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x10
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x20
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x100
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x200
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x400
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x800
	bne _080001B8
	add r2, r2, #4
	ands r0, r1, #0x1000
_080001B8:
	strh r0, [r3, #2]
	ldr r1, _08000280
	add r1, r1, r2
	ldr r0, [r1]
	bx r0

	ARM_FUNC_START intr_main2
intr_main2: @ sub_80001CC
	mov ip, #0x4000000
	add r3, ip, #0x200
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	mov r2, #0
	ands r0, r1, #0x2000
	strbne r0, [r3, #-0x17c]
_080001E8:
	bne _080001E8
	add r2, r2, #4
	ands r0, r1, #1
	strhne r0, [ip, #-8]
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #0x80
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #0x40
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #2
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #4
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #0x100
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #0x200
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #0x400
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #0x800
	bne _08000264
	add r2, r2, #4
	ands r0, r1, #0x1000
_08000264:
	strh r0, [r3, #2]
	ldr r1, _08000284
	add r1, r1, r2
	ldr r0, [r1]
	bx r0
	.align 2, 0
 
.extern AgbMain
_08000278: .4byte gUnknown_03007FFC
_0800027C: .4byte AgbMain+1
_08000280: .4byte gUnknown_03007A00
_08000284: .4byte gUnknown_03007A00

.pool
