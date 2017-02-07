	.file	"main.c"
@ GNU C version 3.2.2 (arm-thumb-elf)
@	compiled by GNU C version 3.2.
@ options passed:  -fpreprocessed -mthumb-interwork -mlong-calls -O2 -Wall
@ -fverbose-asm
@ options enabled:  -fdefer-pop -fomit-frame-pointer
@ -foptimize-sibling-calls -fcse-follow-jumps -fcse-skip-blocks
@ -fexpensive-optimizations -fthread-jumps -fstrength-reduce -fpeephole
@ -fforce-mem -ffunction-cse -fkeep-static-consts -fcaller-saves
@ -freg-struct-return -fgcse -fgcse-lm -fgcse-sm -frerun-cse-after-loop
@ -frerun-loop-opt -fdelete-null-pointer-checks -fschedule-insns
@ -fschedule-insns2 -fsched-interblock -fsched-spec -fbranch-count-reg
@ -freorder-blocks -fcprop-registers -fcommon -fverbose-asm -fgnu-linker
@ -fregmove -foptimize-register-move -fargument-alias -fstrict-aliasing
@ -fmerge-constants -fident -fpeephole2 -fguess-branch-probability
@ -fmath-errno -ftrapping-math -mapcs -mapcs-frame -mapcs-32 -msoft-float
@ -mthumb-interwork -mlong-calls

	.global	__main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"coucou guigui\000"
	.text
	.align	2
	.global	main
	.type	main,function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	ldr	r3, .L6
	sub	fp, ip, #4
	mov	lr, pc
	bx	r3
	ldr	r2, .L6+4
	mov	lr, pc
	bx	r2
	ldr	r3, .L6+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L6+12
	ldr	r3, .L6+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L6+20
	ldr	r5, .L6+24
	ldr	r4, .L6+28
.L2:
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5, #0]	@ movhi
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #0
	bne	.L3
	mov	lr, pc
	bx	r4
	b	.L2
.L3:
	mov	r0, #0
	ldmea	fp, {r4, r5, r6, fp, sp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	__main
	.word	app_init
	.word	app_showImgBackground
	.word	.LC0
	.word	app_writeSomeText
	.word	hel_PadCapture
	.word	__hel_Pad
	.word	hel_SwiVBlankIntrWait
.Lfe1:
	.size	main,.Lfe1-main
	.align	2
	.global	VBLInterruptHandler
	.type	VBLInterruptHandler,function
VBLInterruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	ldr	r3, .L10
	sub	fp, ip, #4
	mov	lr, pc
	bx	r3
	mov	r1, #512
	add	r1, r1, #67108866
	ldrh	r3, [r1, #0]	@ movhi
	mov	r2, #65280
	orr	r3, r3, #1
	strh	r3, [r1, #0]	@ movhi 
	add	r2, r2, #248
	orr	r2, r2, r2, asl #10
	ldrh	r3, [r2, #0]	@ movhi
	orr	r3, r3, #1
	strh	r3, [r2, #0]	@ movhi 
	ldmea	fp, {fp, sp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	hel_ObjTransmit
.Lfe2:
	.size	VBLInterruptHandler,.Lfe2-VBLInterruptHandler
	.global	CHARORDER
	.section	.rodata
	.align	2
	.type	CHARORDER,object
	.size	CHARORDER,101
CHARORDER:
	.ascii	" BCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxy"
	.ascii	"z0123456789,.-;:A#^+*@!\"~$%&/()=?|\\<>[]{}\302\271"
	.ascii	"\302\262\302\263\302\260\000"
	.text
	.align	2
	.global	app_init
	.type	app_init,function
app_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	ldr	r3, .L14
	sub	sp, sp, #12
	sub	fp, ip, #4
	ldr	r5, .L14+4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldrh	r3, [r2, #0]	@ movhi
	bic	r3, r3, #7
	strh	r3, [r2, #0]	@ movhi 
	ldrh	r1, [r2, #0]	@ movhi
	ldr	r0, .L14+12
	strh	r1, [r2, #0]	@ movhi 
	ldr	r3, .L14+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L14+20
	ldr	r3, .L14+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L14+28
	ldr	r3, .L14+32
	mov	lr, pc
	bx	r3
	ldr	r2, .L14+36
	mov	lr, pc
	bx	r2
	mov	r0, #1016
	ldr	r3, .L14+40
	add	r0, r0, #3
	mov	r1, #1
	mov	lr, pc
	bx	r3
	mov	r0, #240
	mov	r1, #10
	mov	lr, pc
	bx	r5
	ldr	r4, .L14+44
	mov	r0, #776
	add	r0, r0, #3
	mov	r1, #0
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, #83886080
	mov	r2, #256
	ldr	r3, .L14+48
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r3, r2
	ldr	ip, .L14+52
	add	r0, r4, #832
	mov	r1, #3008
	mov	lr, pc
	bx	ip
	ldr	r6, .L14+56
	mov	r2, r0
	str	r2, [r6, #24]	@  <variable>.ti
	mov	r1, #0
	ldr	r3, .L14+60
	mov	r0, #128
	mov	lr, pc
	bx	r3
	ldr	ip, .L14+64
	ldr	lr, .L14+68
	mov	r5, r0
	str	ip, [sp, #0]
	mov	r0, #1
	mov	ip, #4
	add	r4, r4, #512
	mov	r3, r4
	mov	r1, r0
	mov	r2, r0
	str	lr, [sp, #4]
	str	ip, [sp, #8]
	str	r5, [r6, #20]	@  <variable>.mi
	ldr	r4, .L14+72
	mov	lr, pc
	bx	r4
	mov	r0, #1
	mov	r2, #0
	mov	r1, r0
	mov	r3, r2
	ldr	ip, .L14+76
	mov	lr, pc
	bx	ip
	ldr	r1, .L14+80
	mov	r0, #0
	ldr	r3, .L14+84
	mov	lr, pc
	bx	r3
	ldmea	fp, {r4, r5, r6, fp, sp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	ham_Init
	.word	hel_PadSetRepeatRate
	.word	hel_SysSetPrefetch
	.word	g_MapSystemBuffer
	.word	hel_MapInit
	.word	g_BgTextSystemMemory
	.word	hel_BgTextInit
	.word	g_ObjSystemBuffer
	.word	hel_ObjInit
	.word	hel_PadInit
	.word	hel_PadSetRepeatDelay
	.word	__ResourceData__+25856
	.word	hel_DmaCopy16
	.word	ham_InitTileSet
	.word	ham_bg
	.word	ham_InitMapEmptySet
	.word	CHARORDER
	.word	g_CharLUT
	.word	hel_BgTextCreate
	.word	ham_InitBg
	.word	VBLInterruptHandler
	.word	hel_IntrStartHandler
.Lfe3:
	.size	app_init,.Lfe3-app_init
	.align	2
	.global	app_showImgBackground
	.type	app_showImgBackground,function
app_showImgBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	ldr	r4, .L17
	mov	r2, #1
	sub	sp, sp, #8
	sub	fp, ip, #4
	mov	r3, r2
	mov	r1, #12288
	mov	r0, r4
	ldr	ip, .L17+4
	mov	lr, pc
	bx	ip
	mov	r5, #9152
	ldr	ip, .L17+8
	mov	r6, r0
	mov	lr, #2
	sub	r4, r4, #1280
	add	r5, r5, #32
	str	r6, [ip, #64]	@  <variable>.ti
	mov	r3, r4
	mov	r0, #3
	mov	r1, #32
	mov	r2, #20
	str	lr, [sp, #0]
	str	r5, [sp, #4]
	ldr	ip, .L17+12
	mov	lr, pc
	bx	ip
	mov	r0, #3
	mov	r1, #1
	mov	r2, r0
	mov	r3, #0
	ldr	ip, .L17+16
	mov	lr, pc
	bx	ip
	ldmea	fp, {r4, r5, r6, fp, sp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	__ResourceData__+1280
	.word	ham_InitTileSet
	.word	ham_bg
	.word	hel_MapCreate
	.word	ham_InitBg
.Lfe4:
	.size	app_showImgBackground,.Lfe4-app_showImgBackground
	.align	2
	.global	app_writeSomeText
	.type	app_writeSomeText,function
app_writeSomeText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	mov	r1, #5
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	lr, r0	@  text
	mov	r2, #13
	mov	r0, #1
	mov	r3, #0
	ldr	ip, .L20
	str	lr, [sp, #0]	@  text
	mov	lr, pc
	bx	ip
	ldmea	fp, {fp, sp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	hel_BgTextPrintF
.Lfe5:
	.size	app_writeSomeText,.Lfe5-app_writeSomeText
	.global	g_BgTextSystemMemory
	.section	.ewram,"aw",%progbits
	.align	2
	.type	g_BgTextSystemMemory,object
	.size	g_BgTextSystemMemory,88
g_BgTextSystemMemory:
	.space	88
	.global	g_CharLUT
	.align	1
	.type	g_CharLUT,object
	.size	g_CharLUT,512
g_CharLUT:
	.space	512
	.global	g_ObjSystemBuffer
	.align	2
	.type	g_ObjSystemBuffer,object
	.size	g_ObjSystemBuffer,4240
g_ObjSystemBuffer:
	.space	4240
	.global	g_MapSystemBuffer
	.align	2
	.type	g_MapSystemBuffer,object
	.size	g_MapSystemBuffer,404
g_MapSystemBuffer:
	.space	404
	.ident	"GCC: (GNU) 3.2.2"
