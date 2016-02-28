; FileName : main.asm
; Author : Norris, Joel R
; Date : 2016_02_08
; Project : HomeWork 5 Part 2, 1

; Assembler directives
.586				; accept instructions for 586
.MODEL FLAT			; generate code for flat memory
INCLUDE io.h		; header file for input / output
.STACK 4096			; reserve 4096-byte stack

.DATA				; DATA section begins : reserve storage for data

	asciiIn		BYTE	10 DUP (?)
	prompt		BYTE	"Enter a character", 00h

	msgLabel	BYTE	"Result", 00h
	msgText		BYTE	"Upper count: "
	asciiUpper	BYTE	11 DUP (?), 0dh, 0ah
				BYTE	"Lower count:"
	asciiLower	BYTE	11 DUP (?), 0dh, 0ah
				BYTE	"Other count:"
	asciiOther	BYTE	11 DUP (?), 00h

	lowerCount	DWORD	0
	upperCount	DWORD	0
	otherCount	DWORD	0
	count		DWORD	20
		
.CODE				; Code section begins

_MainProc			PROC

		inputprompt, asciiIn, 20	; read from user input
		atod asciiIn

done:	dtoa	asciiUpper, upperCount
		dtoa	asciiLower, lowerCount
		dtoa	asciiOther, otherCount	

		output	msgLabel, msgText
		mov		eax, 0
		ret

_MainProc	ENDP						; end of main procedure

			END							; end of source code