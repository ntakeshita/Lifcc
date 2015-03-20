.data
    str.0: .asciiz "\n"
.text
main:
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering readint
    # Allocating space on stack for readint
    addi $sp, $sp, -0
    # Int read node switch
    li $v0, 5
    syscall
    # End clause
# Leaving readint
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
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering readint
    # Allocating space on stack for readint
    addi $sp, $sp, -0
    # Int read node switch
    li $v0, 5
    syscall
    # End clause
# Leaving readint
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
    li $v0 10
    syscall
