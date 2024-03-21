.data
prompt_N: .asciiz "Enter the value of N (<= 10): "
prompt_elem: .asciiz "Enter element: "
output: .asciiz "Output: "

# Allocate space for 10 integers (4 bytes each)
my_array: .space 40

.text
.globl main

main:
    # Prompt for N
    li $v0, 4
    la $a0, prompt_N
    syscall

    # Read N
    li $v0, 5
    syscall
    move $t0, $v0  # Store N in $t0

    # Initialize array
    la $t1, my_array

    # Load separator into $t3
    li $t3, 32  # ASCII value for space (' ')

    # counter to read N integers
    li $t2, 0
read_loop:
    beq $t2, $t0, print_array
    # Prompt for element
    li $v0, 4
    la $a0, prompt_elem
    syscall

    # Read integer
    li $v0, 5
    syscall
    sw $v0, 0($t1)
    addi $t1, $t1, 4
    addi $t2, $t2, 1
    j read_loop

print_array:

    li $v0, 4
    la $a0, output
    syscall


    la $t1, my_array
    li $t2, 0

print_loop:
    lw $a0, 0($t1)
    li $v0, 1
    syscall

    addi $t1, $t1, 4
    addi $t2, $t2, 1
    blt $t2, $t0, print_separator
    j exit_program

print_separator:
 
    li $v0, 11 
    move $a0, $t3
    syscall
    j print_loop

exit_program:

    li $v0, 10
    syscall