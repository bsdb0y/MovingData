#Demo Program to show how to use MOVx instructions

.data
	str:
		.ascii "Hello World"
	ByteLocation:
		.byte 20
	Float:
		.float 9.78
	Int32:
		.int 5
	Int16:
		.short 4
	IntegerArray:
		.int 50,40,30,20,10
.bss
	.comm LargeBuffer, 10000
.text

	.globl _start
		_start:
			nop
			
			#1 Moving immediate value into register 
		movl $10,%eax
		
			#2 Moving immediate value into memory location
		movw $20,Int16
			#3 Moving data between registers
		movl %eax,%ebx
		 	#4 Moving data from memory to register
		movl Int32,%eax
			#5 Mov data from register to memory
		movb $3,%al
		movb %al, ByteLocation
			#6 Mov data into an indexed memory location
			#Location is decided by BaseAddress(offset,Index,Datasize)
			#Offset and Index must be registers , Datasize must be in numerical value
		movl $0,%eax
		movl $3,%edi
		movl $22,IntegerArray(%eax,%edi,4)
		
	        	#Exit syscall to exit program
			movl $1,%eax
			movl $0,%ebx
			int $0x80                       #Software Interrupt 
