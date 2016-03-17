; FileName : main.asm
; Author : Norris, Joel R
; Date : 2016_02_28
; Project : HomeWork 5, Part 2, 4
; Description : 
;	Add 100 + 99 + 98 + ... + N 
;	as long as the sum is less than 2,970

; Assembler directives
.586				; accept instructions for 586
.MODEL FLAT			; generate code for flat memory
INCLUDE io.h		; header file for input / output
.STACK 4096			; reserve 4096-byte stack

.DATA				; DATA section begins : reserve storage for data

asciiIn		DWORD	20 DUP (?)
N			DWORD	00h
sum			DWORD	00h
rangeMax	DWORD	0B9Ah	; 2,970

prompt		BYTE	"Enter an integer", 00h

msgLabel	BYTE	"Result", 00h
msgTxt		BYTE	0dh, 0ah
lrgstSumTxt	BYTE	"Largest sum, 100+99+...+N < 2970:"
lrgstSum	BYTE	11 DUP (?), 0dh, 0ah
lrgstNTxt	BYTE	"Smallest N with 100+99+...+N < 2970:"
lrgstN		BYTE	11 DUP (?), 0dh, 0ah

.CODE				; Code section begins

_MainProc			PROC

			; initialize
			mov		eax, 0		; accumulator
			mov		ebx, 0		; buffer
			mov		ecx, 0		; counter
			mov		edx, 0		; data

			; read integer, convert, assign to memory
			input	prompt, asciiIn, 20
			atod	asciiIn
			mov		N, eax

			; init loop
			mov ebx, 064h
			mov eax, 00h

beginLoop:	
			cmp		eax, rangeMax					; while count < rangeMax
			je done

			add eax, ebx		; add sum to n	 ( accumulator, accumulate )

			cmp ebx, N			; limit, N, if ebx = N, we're done. 
			je	done
			dec	ebx				; add one to n	( 1 + 2 + 3 +...+N )
			
			jmp		beginLoop	

done:		
			; output results
			dtoa	lrgstSum, eax
			dtoa	lrgstN, ebx 

			output	msgLabel, msgTxt
			mov		eax, 0;
			ret

_MainProc			ENDP						; end of main procedure
					
					END							; end of source code