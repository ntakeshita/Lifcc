.data
    str.0: .asciiz "\n"
.text
main:
# Entering sequence
    # Allocating space on stack for sequence
    addi $sp, $sp, -12
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
    # Int print node switch
    lw $a0, 0($sp)
    li $v0, 1
    syscall
    move $v0, $0
    addi $sp, $sp, 4
    # End clause
# Leaving intprint
    # Set to args
    sw $v0, 0($sp)
# Entering stringprint
    # Allocating space on stack for stringprint
    addi $sp, $sp, -4
# Entering "\n"
    # String node switch
    la $v0, str.0
    # End clause
# Leaving "\n"
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
    # Set to args
    sw $v0, 4($sp)
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 0($sp)
    # Int print node switch
    lw $a0, 0($sp)
    li $v0, 1
    syscall
    move $v0, $0
    addi $sp, $sp, 4
    # End clause
# Leaving intprint
    # Set to args
    sw $v0, 8($sp)
    # Sequence node switch
    lw $v0, 8($sp)
    addi $sp, $sp, 12
    # End clause
# Leaving sequence
    li $v0 10
    syscall
