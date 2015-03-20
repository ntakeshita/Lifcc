.data
    str.0: .asciiz "hello world"
.text
main:
# Entering stringprint
    # Allocating space on stack for stringprint
    addi $sp, $sp, -4
# Entering "hello world"
    # String node switch
    la $v0, str.0
    # End clause
# Leaving "hello world"
    # Set to args
    sw $v0, 0($sp)
    # String print node switch
    lw $a0, 0($sp)
    li $v0, 4
    syscall
    move $v0, $0
    addi $sp, $sp, 4
    # End clause
# Leaving stringprint
    li $v0 10
    syscall
