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
			;atod	asciiIn					; convert asciiIn to 2's compliment DWORD int
			;mov		asciiHex, eax
			mov		eax, asciiIn
			
			; compare ranges, A ~ Z, a ~ z
			; start at the low end, in hex, a, and work our way up through Z 
			; jump accordingly
			cmp eax, upperA			; i < A
			jl isOther					
			cmp eax, upperZ			; i <= Z
			jle isUpper
			cmp eax, lowera			; i > a
			jl isOther
			cmp eax, lowerz			; i <= z
			jle isLower

isOther:	
			mov edx, 0
			mov edx, otherCount
			inc	edx
			mov otherCount, edx
			jmp endLoop

isUpper:	
			mov edx, 0
			mov edx, upperCount
			inc	edx
			mov upperCount, edx
			jmp endLoop

isLower:	
			mov edx, 0
			mov edx, lowerCount
			inc	edx
			mov lowerCount, edx

doCount:
			mov edx, [ebx]
			inc edx
			mov [ebx], edx

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