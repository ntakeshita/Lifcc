.data
    str.0: .asciiz "Test.lc"
    str.1: .asciiz "thiisjfisjodfasdfasdflasdlfjasa  %^&*()[[]sdjkljlksljasdklfjasdf;sdlfsjkskldjfkljsjklsjlkfsljkfjklsasdfsfaa"
    str.2: .asciiz "hello"
    str.3: .asciiz "world"
    str.4: .asciiz "check"
    str.5: .asciiz "good day mate"
    str.6: .asciiz "hello"
    str.7: .asciiz "body"
    str.8: .asciiz "pro"
    str.9: .asciiz "hi"
    str.10: .asciiz "Illegal sequence?"
    str.11: .asciiz "word"
    modify.x: .word 1
    modifys.y: .word 0
    lotta_sequences.dk: .word 5
    struct.test_struct: .word 4
    recurse.x: .word 0
    arrow: .word 7
    shitty.x: .word 0
    lotta_sequences.wr: .word 6
    struct.bubble.another: .word 4
    lotta_sequences.x: .word 0
    struct.t: .word 2
    this: .word 0
    x.arg: .word 0
    abc: .word 5
    i: .word 2
    n: .word 6
    lotta_sequences.meepo: .word 4
    wordy: .word 3
    struct.bubble.leet: .word 1
    modifys.i: .word 1
    bubble.butt: .word 0
    hello.pop: .word 2
    hello.arg1: .word 0
    x: .word 1
    struct.lotta_sequences.np: .word 1
    hello.arg2: .word 1
    fib.n: .word 0
.text
main:
# Entering "Test.lc"
    # String node switch
    la $v0, str.0
    # End clause
# Leaving "Test.lc"
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering "thiisjfisjodfasdfasdflasdlfjasa  %^&*()[[]sdjkljlksljasdklfjasdf;sdlfsjkskldjfkljsjklsjlkfsljkfjklsasdfsfaa"
    # String node switch
    la $v0, str.1
    # End clause
# Leaving "thiisjfisjodfasdfasdflasdlfjasa  %^&*()[[]sdjkljlksljasdklfjasdf;sdlfsjkskldjfkljsjklsjlkfsljkfjklsasdfsfaa"
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    la $t0, str.1
    sw $t0, this
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -16
# Entering "hello"
    # String node switch
    la $v0, str.6
    # End clause
# Leaving "hello"
    # Set to args
    sw $v0, 0($sp)
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
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
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
    sw $v0, 4($sp)
# Entering "world"
    # String node switch
    la $v0, str.3
    # End clause
# Leaving "world"
    # Set to args
    sw $v0, 8($sp)
# Entering "check"
    # String node switch
    la $v0, str.4
    # End clause
# Leaving "check"
    # Set to args
    sw $v0, 12($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
    # Assign node switch
    la $t0, struct.test_struct
    lw $t1, 0($sp)
    sw $t1, 0($t0)
    lw $t1, 4($sp)
    sw $t1, 4($t0)
    lw $t1, 8($sp)
    sw $t1, 8($t0)
    lw $t1, 12($sp)
    sw $t1, 12($t0)
    move $v0, $t0
    addi $sp, $sp, 20
    # End clause
# Leaving assign
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -12
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 0($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 4($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 8($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
    # Set to args
    sw $v0, 16($sp)
    # Arrow node switch
    lw $v0, 0($sp)
    addi $sp, $sp, 20
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
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, x
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering x
    # Allocating space on stack for x
    addi $sp, $sp, -4
    # Variable node switch
    la $t0, x
    lw $v0, 0($t0)
    addi $sp, $sp, 4
    # End clause
# Leaving x
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
# Entering 6
    # Int node switch
    addi $v0, $0, 6
    # End clause
# Leaving 6
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, i
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
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
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
# Entering sequence
    # Allocating space on stack for sequence
    addi $sp, $sp, -4
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 0($sp)
    # Sequence node switch
    lw $v0, 0($sp)
    addi $sp, $sp, 4
    # End clause
# Leaving sequence
# Entering sequence
    # Allocating space on stack for sequence
    addi $sp, $sp, -8
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 0($sp)
# Entering "good day mate"
    # String node switch
    la $v0, str.5
    # End clause
# Leaving "good day mate"
    # Set to args
    sw $v0, 4($sp)
    # Sequence node switch
    lw $v0, 4($sp)
    addi $sp, $sp, 8
    # End clause
# Leaving sequence
# Entering "hello"
    # String node switch
    la $v0, str.6
    # End clause
# Leaving "hello"
# Entering "Illegal sequence?"
    # String node switch
    la $v0, str.10
    # End clause
# Leaving "Illegal sequence?"
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering "word"
    # String node switch
    la $v0, str.11
    # End clause
# Leaving "word"
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    la $t0, str.11
    sw $t0, wordy
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, n
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering fib
    # Allocating space on stack for fib
    addi $sp, $sp, -4
# Entering 6
    # Int node switch
    addi $v0, $0, 6
    # End clause
# Leaving 6
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
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering /
    # Allocating space on stack for /
    addi $sp, $sp, -8
# Entering *
    # Allocating space on stack for *
    addi $sp, $sp, -8
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
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
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 0($sp)
# Entering 0
    # Int node switch
    addi $v0, $0, 0
    # End clause
# Leaving 0
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
# Entering /
    # Allocating space on stack for /
    addi $sp, $sp, -8
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 8
    # Int node switch
    addi $v0, $0, 8
    # End clause
# Leaving 8
    # Set to args
    sw $v0, 0($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
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
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 5
    # Int node switch
    addi $v0, $0, 5
    # End clause
# Leaving 5
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
# Entering /
    # Allocating space on stack for /
    addi $sp, $sp, -8
# Entering *
    # Allocating space on stack for *
    addi $sp, $sp, -8
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 10
    # Int node switch
    addi $v0, $0, 10
    # End clause
# Leaving 10
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
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 7
    # Int node switch
    addi $v0, $0, 7
    # End clause
# Leaving 7
    # Set to args
    sw $v0, 0($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
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
# Entering /
    # Allocating space on stack for /
    addi $sp, $sp, -8
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 9
    # Int node switch
    addi $v0, $0, 9
    # End clause
# Leaving 9
    # Set to args
    sw $v0, 0($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
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
# Entering -
    # Allocating space on stack for -
    addi $sp, $sp, -8
# Entering 7
    # Int node switch
    addi $v0, $0, 7
    # End clause
# Leaving 7
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
    sw $v0, 4($sp)
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, abc
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
# Entering +
    # Allocating space on stack for +
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
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
# Entering for
    # Allocating space on stack for for
    addi $sp, $sp, -16
    # For node switch
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
    sw $t0, n
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
For.0:
# Entering lt
    # Allocating space on stack for lt
    addi $sp, $sp, -8
# Entering n
    # Variable node switch
    la $t0, n
    lw $v0, 0($t0)
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
# Entering n
    # Variable node switch
    la $t0, n
    lw $v0, 0($t0)
    # End clause
# Leaving n
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
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering n
    # Variable node switch
    la $t0, n
    lw $v0, 0($t0)
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
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
    beq $0, $0, For.0
Done.0:
    move $v0, $0
    addi $sp, $sp, 16
    # End clause
# Leaving for
# Entering intprint
    # Allocating space on stack for intprint
    addi $sp, $sp, -4
# Entering n
    # Variable node switch
    la $t0, n
    lw $v0, 0($t0)
    # End clause
# Leaving n
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
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -8
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 0($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 4($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
    # Assign node switch
    la $t0, struct.t
    lw $t1, 0($sp)
    sw $t1, 0($t0)
    lw $t1, 4($sp)
    sw $t1, 4($t0)
    move $v0, $t0
    addi $sp, $sp, 12
    # End clause
# Leaving assign
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, arrow
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
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
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    beq $0, $0, Done.1
False.1:
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
Done.1:
    addi $sp, $sp, 12
    # End clause
# Leaving if
# Entering abc
    # Variable node switch
    la $t0, abc
    lw $v0, 0($t0)
    # End clause
# Leaving abc
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 0($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
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
# Entering 4
    # Int node switch
    addi $v0, $0, 4
    # End clause
# Leaving 4
    # Set to args
    sw $v0, 4($sp)
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
    li $v0 10
    syscall
Func.modify:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
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
    sw $t0, 4($fp)
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.modifys:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 7
    # Int node switch
    addi $v0, $0, 7
    # End clause
# Leaving 7
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, 4($fp)
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.funcy:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering "body"
    # String node switch
    la $v0, str.7
    # End clause
# Leaving "body"
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.bubble:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering sequence
    # Allocating space on stack for sequence
    addi $sp, $sp, -20
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -12
# Entering "pro"
    # String node switch
    la $v0, str.8
    # End clause
# Leaving "pro"
    # Set to args
    sw $v0, 0($sp)
# Entering 1337
    # Int node switch
    addi $v0, $0, 1337
    # End clause
# Leaving 1337
    # Set to args
    sw $v0, 4($sp)
# Entering bubble
    # Allocating space on stack for bubble
    addi $sp, $sp, -24
# Entering butt
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving butt
    # Set to args
    sw $v0, 0($sp)
    # Call node switch
    jal Func.bubble
    addi $sp, $sp, 24
    # End clause
# Leaving bubble
    # Set to args
    sw $v0, 8($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
    # Assign node switch
    la $v0, 4($fp)
    lw $t0, 0($sp)
    sw $t0, 4($fp)
    lw $t0, 4($sp)
    sw $t0, 8($fp)
    lw $t0, 8($sp)
    sw $t0, 12($fp)
    addi $sp, $sp, 16
    # End clause
# Leaving assign
    # Set to args
    sw $v0, 0($sp)
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -8
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
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
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
# Entering "hi"
    # String node switch
    la $v0, str.9
    # End clause
# Leaving "hi"
    # Set to args
    sw $v0, 4($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
    # Assign node switch
    la $v0, 16($fp)
    lw $t0, 0($sp)
    sw $t0, 16($fp)
    lw $t0, 4($sp)
    sw $t0, 20($fp)
    addi $sp, $sp, 12
    # End clause
# Leaving assign
    # Set to args
    sw $v0, 4($sp)
# Entering bubble
    # Allocating space on stack for bubble
    addi $sp, $sp, -24
# Entering butt
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving butt
    # Set to args
    sw $v0, 0($sp)
    # Call node switch
    jal Func.bubble
    addi $sp, $sp, 24
    # End clause
# Leaving bubble
    # Set to args
    sw $v0, 8($sp)
# Entering bubble
    # Allocating space on stack for bubble
    addi $sp, $sp, -24
# Entering butt
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving butt
    # Set to args
    sw $v0, 0($sp)
    # Call node switch
    jal Func.bubble
    addi $sp, $sp, 24
    # End clause
# Leaving bubble
    # Set to args
    sw $v0, 12($sp)
# Entering arrow
    # Allocating space on stack for arrow
    addi $sp, $sp, -8
# Entering leet
    # Variable node switch
    # End clause
# Leaving leet
    # Set to args
    sw $v0, 0($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 4($sp)
    # Arrow node switch
    lw $v0, 12($fp)
    addi $sp, $sp, 8
    # End clause
# Leaving arrow
    # Set to args
    sw $v0, 16($sp)
    # Sequence node switch
    lw $v0, 16($sp)
    addi $sp, $sp, 20
    # End clause
# Leaving sequence
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.lotta_sequences:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering sequence
    # Allocating space on stack for sequence
    addi $sp, $sp, -12
# Entering sequence
    # Allocating space on stack for sequence
    addi $sp, $sp, -12
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering struct
    # Allocating space on stack for struct
    addi $sp, $sp, -12
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 0($sp)
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 4($sp)
# Entering 3
    # Int node switch
    addi $v0, $0, 3
    # End clause
# Leaving 3
    # Set to args
    sw $v0, 8($sp)
    # Struct node switch
    move $v0, $sp
# Leaving struct
    # Assign node switch
    la $v0, 4($fp)
    lw $t0, 0($sp)
    sw $t0, 4($fp)
    lw $t0, 4($sp)
    sw $t0, 8($fp)
    lw $t0, 8($sp)
    sw $t0, 12($fp)
    addi $sp, $sp, 16
    # End clause
# Leaving assign
    # Set to args
    sw $v0, 0($sp)
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
    sw $t0, 16($fp)
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    # Set to args
    sw $v0, 4($sp)
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering meepo
    # Variable node switch
    lw $v0, 16($fp)
    # End clause
# Leaving meepo
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
    sw $t0, 20($fp)
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    # Set to args
    sw $v0, 8($sp)
    # Sequence node switch
    lw $v0, 8($sp)
    addi $sp, $sp, 12
    # End clause
# Leaving sequence
    # Set to args
    sw $v0, 0($sp)
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 1
    # Int node switch
    addi $v0, $0, 1
    # End clause
# Leaving 1
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, 24($fp)
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    # Set to args
    sw $v0, 4($sp)
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering meepo
    # Variable node switch
    lw $v0, 16($fp)
    # End clause
# Leaving meepo
    # Set to args
    sw $v0, 0($sp)
# Entering dk
    # Variable node switch
    lw $v0, 20($fp)
    # End clause
# Leaving dk
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
# Entering wr
    # Variable node switch
    lw $v0, 24($fp)
    # End clause
# Leaving wr
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
# Entering x
    # Allocating space on stack for x
    addi $sp, $sp, -4
    # Variable node switch
    lw $v0, 0($fp)
    addi $sp, $sp, 4
    # End clause
# Leaving x
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
    sw $v0, 8($sp)
    # Sequence node switch
    lw $v0, 8($sp)
    addi $sp, $sp, 12
    # End clause
# Leaving sequence
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

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
    beq $v0, $0, False.3
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
    bne $v0, $0, True.2
    beq $0, $0, False.2
True.2:
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
    beq $0, $0, Done.2
False.2:
# Entering n
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving n
Done.2:
    addi $sp, $sp, 12
    # End clause
# Leaving if
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.x:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 0($sp)
# Entering arg
    # Variable node switch
    lw $v0, 0($fp)
    # End clause
# Leaving arg
    # Set to args
    sw $v0, 4($sp)
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.shitty:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering x
    # Allocating space on stack for x
    addi $sp, $sp, -4
    # Variable node switch
    lw $v0, 0($fp)
    addi $sp, $sp, 4
    # End clause
# Leaving x
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.recurse:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering recurse
    # Allocating space on stack for recurse
    addi $sp, $sp, -4
# Entering +
    # Allocating space on stack for +
    addi $sp, $sp, -8
# Entering x
    # Allocating space on stack for x
    addi $sp, $sp, -4
    # Variable node switch
    lw $v0, 0($fp)
    addi $sp, $sp, 4
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
    # Plus node switch
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    add $v0, $t0, $t1
    addi $sp, $sp, 8
    # End clause
# Leaving +
    # Set to args
    sw $v0, 0($sp)
    # Call node switch
    jal Func.recurse
    addi $sp, $sp, 4
    # End clause
# Leaving recurse
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

Func.hello:
    move $t0, $fp
    move $fp, $sp
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)
# Entering assign
    # Allocating space on stack for assign
    addi $sp, $sp, -4
# Entering 2
    # Int node switch
    addi $v0, $0, 2
    # End clause
# Leaving 2
    # Set to args
    sw $v0, 0($sp)
    # Assign node switch
    lw $t0, 0($sp)
    sw $t0, 8($fp)
    move $v0, $t0
    addi $sp, $sp, 4
    # End clause
# Leaving assign
    lw $ra, 0($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 8
    jr $ra

