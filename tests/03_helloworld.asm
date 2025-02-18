;---------
;external functions from libutil.o declared here
;---------
extern print_string
extern exit_prog

;---------
; initialized data here
;---------

section .data
	mesg 		db 		"Hello, world!", 0xa
	mesglen 	equ 	$ - mesg

;---------
; code goes here
;---------

section .text

; The '_start' label identifies the program's entry point for the linker for the nasm assembler.
; If using GCC, the entry point is labeled 'main'

global _start
_start:

	mov r8, 0
	loop:
		; call message
		call message
		inc r8
		cmp r8, 5
		jl loop

	; exit the program now
	call exit_prog

global message
message:
	;---------
	; send message string to standard output
	;---------

	mov rsi, mesg
	mov rdx, mesglen
	call print_string
	ret

