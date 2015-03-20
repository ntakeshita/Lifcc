.data
    str.0: .asciiz "\n"
    x: .word 1
.text
main:
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 10
    # Int node switch
    addi $v0, $0, 10
    # End clause
# Leaving 10
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, x
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering while
    # Allocating space on stack for while
    addi $sp, $sp, -8
    # While node switch
While.0:
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering x
    # Variable node switch
    la $t0, x
    lw $v0, 0($t0)
    # End clause
# Leaving x
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
    # Minus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    sub $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving -
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, x
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    beq $v0, $0, Done.0
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering x
    # Variable node switch
    la $t0, x
    lw $v0, 0($t0)
    # End clause
# Leaving x
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
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
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
    j While.0
Done.0:
    move $v0, $0
    addi $sp, $sp, 8
    # End clause
# Leaving while
    li $v0 10
    syscall
