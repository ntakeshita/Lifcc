.data
    str.0: .asciiz "hi"
    str.1: .asciiz "string"
    str.2: .asciiz "\n"
.text
main:
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 0($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 4($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -16
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 20($sp)
    # Arrow node switch
    lw $v0, 8($sp)
    addi $sp, $sp, 24
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 12($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -20
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 24($sp)
    # Arrow node switch
    lw $v0, 16($sp)
    addi $sp, $sp, 28
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 20($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -16
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering "hi"
    # String node switch
    la $v0, str.0
    # End clause
# Leaving "hi"
    # Set to args
    sw $v0, 4($sp)
# Entering "string"
    # String node switch
    la $v0, str.1
    # End clause
# Leaving "string"
    # Set to args
    sw $v0, 8($sp)
# Entering "\n"
    # String node switch
    la $v0, str.2
    # End clause
# Leaving "\n"
    # Set to args
    sw $v0, 12($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 20($sp)
    # Arrow node switch
    lw $v0, 12($sp)
    addi $sp, $sp, 24
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 0($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 4($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -16
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 20($sp)
    # Arrow node switch
    lw $v0, 8($sp)
    addi $sp, $sp, 24
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 12($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -20
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 24($sp)
    # Arrow node switch
    lw $v0, 16($sp)
    addi $sp, $sp, 28
    # End clause
# Leaving arrow
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
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -24
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 0($sp)
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 4($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 8($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 12($sp)
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 16($sp)
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 20($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
    # Set to args
    sw $v0, 28($sp)
    # Arrow node switch
    lw $v0, 20($sp)
    addi $sp, $sp, 32
    # End clause
# Leaving arrow
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
