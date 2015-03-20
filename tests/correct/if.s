.data
    str.0: .asciiz "success\n"
    str.1: .asciiz "fail\n"
    str.2: .asciiz "fail\n"
    str.3: .asciiz "success\n"
.text
main:
# Entering if
    # Allocating space on stack for if
    addi $sp, $sp, -12
    # If node switch
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    bne $v0, $0, True.0
    beq $0, $0, False.0
True.0:
# Entering stringprint
    # Allocating space on stack for stringprint
    addi $sp, $sp, -4
# Entering "success\n"
    # String node switch
    la $v0, str.3
    # End clause
# Leaving "success\n"
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
    beq $0, $0, Done.0
False.0:
# Entering stringprint
    # Allocating space on stack for stringprint
    addi $sp, $sp, -4
# Entering "fail\n"
    # String node switch
    la $v0, str.2
    # End clause
# Leaving "fail\n"
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
Done.0:
    addi $sp, $sp, 12
    # End clause
# Leaving if
# Entering if
    # Allocating space on stack for if
    addi $sp, $sp, -12
    # If node switch
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    bne $v0, $0, True.1
    beq $0, $0, False.1
True.1:
# Entering stringprint
    # Allocating space on stack for stringprint
    addi $sp, $sp, -4
# Entering "fail\n"
    # String node switch
    la $v0, str.2
    # End clause
# Leaving "fail\n"
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
    beq $0, $0, Done.1
False.1:
# Entering stringprint
    # Allocating space on stack for stringprint
    addi $sp, $sp, -4
# Entering "success\n"
    # String node switch
    la $v0, str.3
    # End clause
# Leaving "success\n"
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
Done.1:
    addi $sp, $sp, 12
    # End clause
# Leaving if
    li $v0 10
    syscall
