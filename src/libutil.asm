;--------
; libutil.asm - library for commonly used functions
;--------
;--------


;--------
; initialized data here
;--------

section .data
	SYS_write	equ		1
	STDOUT		equ		1
	SYS_exit	equ		60
	EXIT_OK		equ		0
	mesg 	db	"Hello, world!", 0xa
	mesglen equ	$ - mesg


;--------
; code starts from here
;--------

section .text
	global print_string
	global exit_prog
	global test_message

;--------
; prints string from register rsi and string length from rdx.
; rax and rdi are initialised in this function and rsi and rdx
; are setup by caller.
;--------
print_string:
	mov rax, SYS_write
	mov rdi, STDOUT
	syscall
	ret


;--------
; exit the program with EXIT_OK as status
; rax and rdi are initialised in this function.
; This function is also called by C program (03_asm_from_c.c) to remove
; dependency from libc.
;--------
exit_prog:
	mov rax, SYS_exit
	mov rdi, EXIT_OK
	syscall


;--------
; prints a dummy message by calling 'print' function defined above.
; message (mesg) and message length (mesglen) are defined in 'data' section.
; This function is called by C program 03_asm_from_c.c
;--------
test_message:
	mov rsi, mesg
	mov rdx, mesglen
	call print_string
	ret
