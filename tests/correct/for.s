.data
    i: .word 1
.text
main:
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, i
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering for
    # Allocating space on stack for for
    addi $sp, $sp, -16
    # For node switch
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
For.0:
# Entering lt
    # Allocating space on stack for lt
    addi $sp, $sp, -8
# Entering i
    # Variable node switch
    la $t0, i
    lw $v0, 0($t0)
    # End clause
# Leaving i
    # Set to args
    sw $v0, 0($sp)
# Entering 10
    # Int node switch
    addi $v0, $0, 10
    # End clause
# Leaving 10
    # Set to args
    sw $v0, 4($sp)
    # Less than node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    slt $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving lt
    beq $v0, $0, Done.0
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering i
    # Variable node switch
    la $t0, i
    lw $v0, 0($t0)
    # End clause
# Leaving i
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
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering i
    # Variable node switch
    la $t0, i
    lw $v0, 0($t0)
    # End clause
# Leaving i
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
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
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, i
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    beq $0, $0, For.0
Done.0:
    move $v0, $0
    addi $sp, $sp, 16
    # End clause
# Leaving for
    li $v0 10
    syscall
