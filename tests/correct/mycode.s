.data
    str.0: .asciiz "A truly nasty example of scoping in LIFC."
    str.1: .asciiz "Credit for it goes to Ulysse Manceron."
    mycode: .word 0
    mycode.mycode: .word 0
.text
main:
# Entering "A truly nasty example of scoping in LIFC."
    # String node switch
    la $v0, str.0
    # End clause
# Leaving "A truly nasty example of scoping in LIFC."
# Entering "Credit for it goes to Ulysse Manceron."
    # String node switch
    la $v0, str.1
    # End clause
# Leaving "Credit for it goes to Ulysse Manceron."
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 21
    # Int node switch
    addi $v0, $0, 21
    # End clause
# Leaving 21
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, mycode
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering mycode
    # Allocating space on stack for mycode
    addi $sp, $sp, -4
# Entering *
    # Allocating space on stack for *
    addi $sp, $sp, -8
# Entering mycode
    # Allocating space on stack for mycode
    addi $sp, $sp, -4
    # Variable node switch
    la $t0, mycode
    lw $v0, 0($t0)
    addi $sp, $sp, 4
    # End clause
# Leaving mycode
    # Set to args
    sw $v0, 0($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
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
    # Call node switch
    jal Func.mycode
    addi $sp, $sp, 4
    # End clause
# Leaving mycode
    li $v0 10
    syscall
Func.mycode:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering mycode
    # Allocating space on stack for mycode
    addi $sp, $sp, -4
    # Variable node switch
    lw $v0, 0($fp)
    addi $sp, $sp, 4
    # End clause
# Leaving mycode
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
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

