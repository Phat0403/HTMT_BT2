    .data
prompt:     .asciiz "Input a character (only character accepted): "
uppercase:  .asciiz "\nResult: uppercase\n"
lowercase:  .asciiz "\nResult: lowercase\n"
not_alpha_msg:  .asciiz "\nNot an alphabet character!\n"

    .text
    .globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 12         
    syscall
    move $t0, $v0       
    
    li $t1, 65
    li $t2, 90
    blt $t0, $t1, not_alpha   
    bgt $t0, $t2, check_lower  
    
    li $v0, 4
    la $a0, uppercase
    syscall
    j end
    
check_lower:

    li $t1, 97
    li $t2, 122
    blt $t0, $t1, not_alpha 
    bgt $t0, $t2, not_alpha  
    

    li $v0, 4
    la $a0, lowercase
    syscall
    j end
    
not_alpha:

    li $v0, 4
    la $a0, not_alpha_msg
    syscall
    
end:
    li $v0, 10
    syscall
