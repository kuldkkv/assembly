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
; prints string from register ecx and string length from edx
;--------
print_string:
	mov rax, SYS_write
	mov rdi, STDOUT
	syscall
	ret


;--------
; exit the program with EXIT_OK as status
;--------
exit_prog:
	mov rax, SYS_exit
	mov rdi, EXIT_OK
	syscall


test_message:
	mov rsi, mesg
	mov rdx, mesglen
	call print_string
	ret
