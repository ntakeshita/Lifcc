.data
    fib.n: .word 0
.text
main:
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering fib
    # Allocating space on stack for fib
    addi $sp, $sp, -4
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 0($sp)
    # Call node switch
    jal Func.fib
    addi $sp, $sp, 4
    # End clause
# Leaving fib
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
Func.fib:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering if
    # Allocating space on stack for if
    addi $sp, $sp, -12
    # If node switch
# Entering and
    # Allocating space on stack for and
    addi $sp, $sp, -8
    # And node switch
# Entering n
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving n
    beq $v0, $0, False.1
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering n
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving n
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
    bne $v0, $0, True.0
    beq $0, $0, False.0
True.0:
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering fib
    # Allocating space on stack for fib
    addi $sp, $sp, -4
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering n
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving n
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
    # Call node switch
    jal Func.fib
    addi $sp, $sp, 4
    # End clause
# Leaving fib
    # Set to args
    sw $v0, 0($sp)
# Entering fib
    # Allocating space on stack for fib
    addi $sp, $sp, -4
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering n
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving n
    # Set to args
    sw $v0, 0($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
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
    # Call node switch
    jal Func.fib
    addi $sp, $sp, 4
    # End clause
# Leaving fib
    # Set to args
    sw $v0, 4($sp)
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
    beq $0, $0, Done.0
False.0:
# Entering n
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving n
Done.0:
    addi $sp, $sp, 12
    # End clause
# Leaving if
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

