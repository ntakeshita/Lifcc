.data
.text
main:
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 0($sp)
# Entering 6
    # Int node switch
    addi $v0, $0, 6
    # End clause
# Leaving 6
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
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 0($sp)
# Entering 6
    # Int node switch
    addi $v0, $0, 6
    # End clause
# Leaving 6
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
    # Int print node switch
    lw $a0, 0($sp)
    li $v0, 1
    syscall
    move $v0, $0
    addi $sp, $sp, 4
    # End clause
# Leaving intprint
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering /
    # Allocating space on stack for /
    addi $sp, $sp, -8
# Entering 6
    # Int node switch
    addi $v0, $0, 6
    # End clause
# Leaving 6
    # Set to args
    sw $v0, 0($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 4($sp)
    # Divide node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    div $t0, $t1
    mflo $v0
    addi $sp, $sp, 8
    # End clause
# Leaving /
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
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering *
    # Allocating space on stack for *
    addi $sp, $sp, -8
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 0($sp)
# Entering 6
    # Int node switch
    addi $v0, $0, 6
    # End clause
# Leaving 6
    # Set to args
    sw $v0, 4($sp)
    # Multiply node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    mult $t0, $t1
    mflo $v0
    addi $sp, $sp, 8
    # End clause
# Leaving *
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
