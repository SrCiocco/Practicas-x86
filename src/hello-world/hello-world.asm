.intel_syntax noprefix

.section .data
msg: 
	.ascii "Hello, World!\n"
msg_len = . - msg

.section .text
.global _start

_start:
	# sys_write(stdout, msg, len);
	mov rax, 1 # syscall 1: write
	mov rdi, 1 # fd: stdout
	lea rsi, [rip + msg] # puntero a msg (load effective address)
	mov rdx, msg_len # longitud del mensaje
	syscall

	# sys_exit(0);
	mov rax, 60 # syscall 60: exit
	xor rdi, rdi # error code: 0 (SUCCESS)
	syscall
