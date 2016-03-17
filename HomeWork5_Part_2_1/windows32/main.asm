; FileName : main.asm
; Author : Norris, Joel R
; Date : 2016_02_28
; Project : HomeWork 5, Part 1

; Assembler directives
.586				; accept instructions for 586
.MODEL FLAT			; generate code for flat memory
INCLUDE io.h		; header file for input / output
.STACK 4096			; reserve 4096-byte stack

.DATA				; DATA section begins : reserve storage for data

asciiIn		DWORD	20 DUP (?)
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

asciiHex	DWORD	0
lowera		DWORD	061h
lowerz		DWORD	07Ah				
upperA		DWORD	041h
upperZ		DWORD	05Ah
			
.CODE				; Code section begins

_MainProc			PROC

			mov		ecx, 0
			mov		eax, 0

beginLoop:	cmp		count, 10					; while count < 10
			jge		done	

			; read in character
			input	prompt, asciiIn, 20
			mov		eax, asciiIn

			cmp eax, lowera
			jnge notLower
			cmp eax, lowerz
			jnle notLower
			inc lowerCount
			jmp next

notLower:	cmp eax, upperA
			jl other
			cmp eax, upperZ
			jg other
			inc upperCount
			jmp next

other:		inc otherCount
next:		inc count
			jmp beginLoop

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
