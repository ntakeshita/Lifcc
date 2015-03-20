.data
.text
main:
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering lt
    # Allocating space on stack for lt
    addi $sp, $sp, -8
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 4($sp)
    # Less than node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    slt $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving lt
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
# Entering lt
    # Allocating space on stack for lt
    addi $sp, $sp, -8
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 4($sp)
    # Less than node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    slt $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving lt
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
# Entering lt
    # Allocating space on stack for lt
    addi $sp, $sp, -8
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 0($sp)
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 4($sp)
    # Less than node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    slt $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving lt
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
# Entering lt
    # Allocating space on stack for lt
    addi $sp, $sp, -8
# Entering -4
    # Int node switch
    addi $v0, $0, -4
    # End clause
# Leaving -4
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
    # Less than node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    slt $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving lt
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
# Entering eq
    # Allocating space on stack for eq
    addi $sp, $sp, -8
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 4($sp)
    # Equals node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    beq $t0, $t1, True.0
    beq $0, $0, False.0
True.0:
    li $v0, 1
    beq $0, $0, Done.0
False.0:
    li $v0, 0
Done.0:
    addi $sp, $sp, 8
    # End clause
# Leaving eq
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
# Entering eq
    # Allocating space on stack for eq
    addi $sp, $sp, -8
# Entering 7
    # Int node switch
    addi $v0, $0, 7
    # End clause
# Leaving 7
    # Set to args
    sw $v0, 0($sp)
# Entering 58
    # Int node switch
    addi $v0, $0, 58
    # End clause
# Leaving 58
    # Set to args
    sw $v0, 4($sp)
    # Equals node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    beq $t0, $t1, True.1
    beq $0, $0, False.1
True.1:
    li $v0, 1
    beq $0, $0, Done.1
False.1:
    li $v0, 0
Done.1:
    addi $sp, $sp, 8
    # End clause
# Leaving eq
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
# Entering eq
    # Allocating space on stack for eq
    addi $sp, $sp, -8
# Entering -1
    # Int node switch
    addi $v0, $0, -1
    # End clause
# Leaving -1
    # Set to args
    sw $v0, 0($sp)
# Entering -1
    # Int node switch
    addi $v0, $0, -1
    # End clause
# Leaving -1
    # Set to args
    sw $v0, 4($sp)
    # Equals node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    beq $t0, $t1, True.2
    beq $0, $0, False.2
True.2:
    li $v0, 1
    beq $0, $0, Done.2
False.2:
    li $v0, 0
Done.2:
    addi $sp, $sp, 8
    # End clause
# Leaving eq
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
