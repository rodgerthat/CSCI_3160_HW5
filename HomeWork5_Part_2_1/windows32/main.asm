; FileName : main.asm
; Author : Norris, Joel R
; Date : 2016_02_08
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

beginLoop:	cmp		ecx, 10					; while count < 10
			jge		done	

			; read in character
			input	prompt, asciiIn, 20
			mov		eax, asciiIn
			
			; compare ranges, A ~ Z, a ~ z
			; start at the low end, in hex, A, and work our way up through z 
			; pass a memory address of which counter to increment 
			; jump accordingly

			cmp eax, upperA			; i < A
			mov ebx, OFFSET [otherCount]	
			jl doCount

			cmp eax, upperZ			; i <= Z
			mov ebx, OFFSET [upperCount]
			jle doCount

			cmp eax, lowera			; i > a
			mov ebx, OFFSET [otherCount]
			jl doCount

			cmp eax, lowerz			; i <= z
			mov ebx, OFFSET [lowerCount]
			jle doCount

doCount:
			; increment the correct counter, based on memory address
			mov edx, [ebx]
			inc edx
			mov [ebx], edx

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