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

asciiIn		BYTE	20 DUP (?)
prompt		BYTE	"Enter a character", 00h

msgLabel	BYTE	"Result", 00h
msgText		BYTE	"Upper count: "
asciiUpper	BYTE	11 DUP (?), 0dh, 0ah 
			BYTE	"Lower count: "
asciiLower	BYTE	11 DUP (?), 0dh, 0ah
			BYTE	"Other count: "
asciiOther	BYTE	11 DUP (?), 00h

lowerCount	DWORD	0
upperCount	DWORD	0
otherCount	DWORD	0
count		DWORD	0

a			DWORD	061h;
z			DWORD	07Ah				
A			DWORD	041h;
Z			DWORD	05Ah;
			
.CODE				; Code section begins

_MainProc			PROC

			mov		ecx, 0;
			mov		eax, 0;

beginLoop:	cmp		ecx, 10					; while count < 10
			jg		done	

			; read in character
			input	prompt, asciiIn, 20
			atod	asciiIn
			
			; compare ranges, a ~ z, A ~ Z
			; jump accordingly
			mov eax, asciiIn
			cmp eax, A
			jl isOther
			cmp eax, Z
			jle isUpper
			cmp eax, a
			jl isOther
			cmp eax, z
			jle isLower

isOther:	
			mov edx, 0
			mov edx, isOther
			inc	edx
			mov isOther, edx
			jmp endLoop

isUpper:	
			mov edx, 0
			mov edx, isUpper
			inc	edx
			mov isUpper, edx
			jmp endLoop

isLower:	
			mov edx, 0
			mov edx, isLower
			inc	edx
			mov isLower, edx

endLoop:	
			inc ecx			; counter ++
			jmp	beginLoop	; manual loops r fun.	

done:		
			; output results
			dtoa	asciiUpper, upperCount
			dtoa	asciiLower, lowerCount
			dtoa	asciiOther, otherCount

			output	msgLabel, msgText
			mov		eax, 0;
			ret

_MainProc			ENDP						; end of main procedure
					
					END							; end of source code