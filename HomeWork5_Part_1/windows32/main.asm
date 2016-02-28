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
					value		WORD	0FF9Ch
					ax_value	WORD	00064h

.CODE				; Code section begins

_MainProc			PROC

					; initialize registers
					mov eax, 0;
					mov ebx, 0;
					mov ecx, 0;
					mov edx, 0;

					; PART I

					; a.
					;call _loadAX
					;cmp		value, ax
					;jl		next

					; b.
					call _loadAX
					cmp		ax, value
					jnbe	next

					; c. 
					call _loadAX
					cmp		value, -100
					jne		next

					; d.
					call _loadAX
					cmp		ax, 100
					jg		next

					; e.
					call _loadAX
					add		value, 100		
					jz		next

					; f.
					call _loadAX
					add		value, 100
					jno		next

					; g.
					call _loadAX
					add		value, 100
					jc		next
					
					; h.
					call _loadAX
					add		value, 100
					js		next
					
next:				


					; program end				
					mov		eax, 0;				; exit w/ return code 0
					ret
_MainProc			ENDP						; end of main procedure
					

					; load the AX register w/ the value for each example
_loadAX				PROC
					mov		eax, 0
					mov		ax, ax_value
					ret
_loadAX				ENDP


					END							; end of source code