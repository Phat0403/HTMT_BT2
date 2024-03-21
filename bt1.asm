.data
msg1: .asciiz"Input a:"
msg2: .asciiz"Input b:"
msg3: .asciiz"Result:a=b"
msg4: .asciiz"Result:a<b"
msg5: .asciiz"Result:a>b"


.text
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,msg2
syscall

li $v0,5
syscall
move $t1,$v0

beq $t0, $t1, printEqual

slt $s0,$t0,$t1
bne $s0,$zero,printSmaller
beq $s0,$zero,printGreater

printEqual:
li $v0,4
la $a0,msg3
syscall
j Exit

printSmaller:
li $v0,4
la $a0,msg4
syscall
j Exit

printGreater:
li $v0,4
la $a0,msg5
syscall

Exit:
  li $v0, 10
  syscall