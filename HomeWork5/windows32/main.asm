; FileName : main.asm
; Author : Norris, Joel R
; Date : 2016_02_08
; Project : HomeWork 5

; Assembler directives
.586				; accept instructions for 586
.MODEL FLAT			; generate code for flat memory
INCLUDE io.h		; header file for input / output
.STACK 4096			; reserve 4096-byte stack

.DATA				; DATA section begins : reserve storage for data
					; results are obtained with debugging
					WORD	value		FF9C
					WORD	ax_value	0064

.CODE				; Code section begins
_MainProc			PROC

					; initialize registers
					mov eax, 0;
					mov ebx, 0;

					; PART I

					; a.
					mov	ax, ax_value
					cmp	value, ax
					jl	next


					; b.



					; load the AX register w/ the value for each example
loadAX				PROC
					mov ax, ax_value
					ENDP


next				PROC



					; program end				
					mov		eax, 0;				; exit w/ return code 0
					ret
_MainProc			ENDP						; end of main procedure
					END							; end of source code
					