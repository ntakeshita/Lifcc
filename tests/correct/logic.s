.data
.text
main:
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering and
    # Allocating space on stack for and
    addi $sp, $sp, -8
    # And node switch
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    beq $v0, $0, False.0
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    beq $v0, $0, False.0
    beq $0, $0, True.0
False.0:
    addi $v0, $0, 0
    j Done.0
True.0:
    addi $v0, $0, 1
Done.0:
    addi $sp, $sp, 8
    # End clause
# Leaving and
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
# Entering and
    # Allocating space on stack for and
    addi $sp, $sp, -8
    # And node switch
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    beq $v0, $0, False.1
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    beq $v0, $0, False.1
    beq $0, $0, True.1
False.1:
    addi $v0, $0, 0
    j Done.1
True.1:
    addi $v0, $0, 1
Done.1:
    addi $sp, $sp, 8
    # End clause
# Leaving and
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
# Entering and
    # Allocating space on stack for and
    addi $sp, $sp, -8
    # And node switch
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    beq $v0, $0, False.2
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    beq $v0, $0, False.2
    beq $0, $0, True.2
False.2:
    addi $v0, $0, 0
    j Done.2
True.2:
    addi $v0, $0, 1
Done.2:
    addi $sp, $sp, 8
    # End clause
# Leaving and
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
# Entering and
    # Allocating space on stack for and
    addi $sp, $sp, -8
    # And node switch
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    beq $v0, $0, False.3
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    beq $v0, $0, False.3
    beq $0, $0, True.3
False.3:
    addi $v0, $0, 0
    j Done.3
True.3:
    addi $v0, $0, 1
Done.3:
    addi $sp, $sp, 8
    # End clause
# Leaving and
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
# Entering or
    # Allocating space on stack for or
    addi $sp, $sp, -8
    # Or node switch
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    bne $v0, $0, True.4
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    bne $v0, $0, True.4
    addi $v0, $0, 0
    j Done.4
True.4:
    addi $v0, $0, 1
Done.4:
    addi $sp, $sp, 8
    # End clause
# Leaving or
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
# Entering or
    # Allocating space on stack for or
    addi $sp, $sp, -8
    # Or node switch
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    bne $v0, $0, True.5
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    bne $v0, $0, True.5
    addi $v0, $0, 0
    j Done.5
True.5:
    addi $v0, $0, 1
Done.5:
    addi $sp, $sp, 8
    # End clause
# Leaving or
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
# Entering or
    # Allocating space on stack for or
    addi $sp, $sp, -8
    # Or node switch
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    bne $v0, $0, True.6
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    bne $v0, $0, True.6
    addi $v0, $0, 0
    j Done.6
True.6:
    addi $v0, $0, 1
Done.6:
    addi $sp, $sp, 8
    # End clause
# Leaving or
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
# Entering or
    # Allocating space on stack for or
    addi $sp, $sp, -8
    # Or node switch
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    bne $v0, $0, True.7
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    bne $v0, $0, True.7
    addi $v0, $0, 0
    j Done.7
True.7:
    addi $v0, $0, 1
Done.7:
    addi $sp, $sp, 8
    # End clause
# Leaving or
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
