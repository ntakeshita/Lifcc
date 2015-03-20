#include "code_gen.h"
#include "parser.h"
#include "stdlib.h"

/** A counter to prevent the issuance of duplicate labels. */
unsigned label_count = 0;
/** True iff the data segment has already been partially printed. */
int data_seg_opened = 0;
/** True iff the text segment has already been partially printed. */
int text_seg_opened = 0;
int num_strings = 0;



void emit_strings(AST *ast) {
    /* TODO: Implement me. */
    data_seg_opened = 1;
    if (ast->type == node_STRING){
	    smap_put(strings, ast->val, num_strings);
		printf("    str.%d: .asciiz %s\n", num_strings, ast->val);
		num_strings++;
    }else{
    	AST_lst* child_ptr = ast->children;
   		while (child_ptr != NULL){
    		if (child_ptr->val->type == node_STRING){
    			smap_put(strings, child_ptr->val->val, num_strings);
    			printf("    str.%d: .asciiz %s\n", num_strings, child_ptr->val->val);
    			num_strings++;
    		}else{
    			emit_strings(child_ptr->val);
    		}
    		child_ptr = child_ptr->next;
    	}
    }
}

void emit_static_memory() {
    /* TODO: Implement me. */
   	print_smap(decls);
	text_seg_opened = 1;
}

void emit_main(AST *ast) {
    /* TODO: Implement me. */
    call(ast, -1, "", 0);
}

void call(AST* ast, int parent_type, char* call_name, int is_func){
    /* Call takes in the current ast, the type of its parent (-1 if parent is global frame), 
    and then whether the call is taking place from within a variable. If it is taking place 
    from within a variable, then we look for the local variable name first before we look 
    for the global. */

    /* Decrements the stack pointer by the ((num_args + 1) * 4). Once we have allocated
    the stack pointer such that we can fit our arguments, we recursively call the sub-AST
    with call and then take that result (stored in $v0) and store it in the corresponding 
    argument position on the stack.
    Finally, we call the helper function that corresponds with each keyword. The helper function
    stores the result into $v0 and then reset $ra and $sp to their original positions.
    */


    /* Evaluates the children first in the while loop, given that the AST has children. Allocates
    enough memory on the stack in order to store the arguments from the calls on the stack. */

    if (ast->type == node_FUNCTION){
        return;
    }
    printf("# Entering %s\n", ast->val);
    int sp_index = 0;
    int stack_restore = 0;

    /* Allocates space on the stack depending on the number arguments or number of local
    variables, including arguments. */

    if (smap_get(num_args, ast->val) != -1){
        printf("    # Allocating space on stack for %s\n", ast->val);
        if (ast->type == node_CALL) {
            stack_restore = smap_get(stack_sizes, ast->val) * 4;
        } else if (ast->type == node_ASSIGN) {
            stack_restore = 4;
        } else if (smap_get(num_args, ast->val) > -1) {
            stack_restore = smap_get(num_args, ast->val) * 4;
        } else if (smap_get(num_args, ast->val) == -2) {
            stack_restore = (int) AST_lst_len(ast->children) * 4;
        }
        printf("    addi $sp, $sp, -%d\n", stack_restore);
    }

    /* Evaluates the argument expressions except in the cases that the keyword is 
    'and', 'or', 'while', 'if', 'for', 'call'. */

    if ((int)AST_lst_len(ast->children) > 0 && ast->type != node_AND && ast->type != node_OR
        && ast->type != node_WHILE && ast->type != node_IF && ast->type != node_FOR) {
        AST_lst *child_ptr = ast->children;
        if (ast->type == node_ASSIGN){
            child_ptr = child_ptr->next;
        }
        while (child_ptr != NULL){
            call(child_ptr->val, ast->type, call_name, is_func);
            if (child_ptr->val->type == node_STRUCT){
                sp_index += (int) AST_lst_len(child_ptr->val->children);
                stack_restore += (int) AST_lst_len(child_ptr->val->children) * 4;
            } else {
                printf("    # Set to args\n");\
                printf("    sw $v0, %d($sp)\n", sp_index * 4);
            }
            sp_index++;
            child_ptr = child_ptr->next;
        }
    }

    /* Switch statement to evaluate the actual value of the function. */
    switch (ast->type){

        /* Integer node: expects 0 args*/
        case node_INT:
            printf("    # Int node switch\n");
            printf("    addi $v0, $0, %s\n", ast->val);
            break;

        /* String node: expects 0 args */
        case node_STRING:
            printf("    # String node switch\n");
            printf("    la $v0, str.%d\n", smap_get(strings, ast->val));
            break;

        /* Variable node: expects 0 args*/
        case node_VAR:
            printf("    # Variable node switch\n");
            if (parent_type != node_ASSIGN && parent_type != node_ARROW){
                if (!is_func) {
                    printf("    la $t0, %s\n", ast->val);
                    printf("    lw $v0, 0($t0)\n");
                } else {
                    char name[(int)(strlen(ast->val) + strlen(call_name) + 2)];
                    sprintf(name, "%s.%s", call_name, ast->val);
                    printf("    lw $v0, %d($fp)\n", smap_get(decls, name) * 4);
                }
            }
            break;

        /* Call node: expects * args */
        case node_CALL:
            printf("    # Call node switch\n");
            printf("    jal Func.%s\n", ast->val);
            break;

        /* And node: expects 2 args */
        case node_AND:
            printf("    # And node switch\n");
            int label_AND = label_count++;
            call(ast->children->val, ast->type, call_name, is_func);
            printf("    beq $v0, $0, False.%d\n", label_AND);
            call(ast->children->next->val, ast->type, call_name, is_func);
            printf("    beq $v0, $0, False.%d\n", label_AND);
            printf("    beq $0, $0, True.%d\n", label_AND);
            printf("False.%d:\n", label_AND);
            printf("    addi $v0, $0, 0\n");
            printf("    j Done.%d\n", label_AND);
            printf("True.%d:\n", label_AND);
            printf("    addi $v0, $0, 1\n");
            printf("Done.%d:\n", label_AND);
            break;

        /* Or node: expects 2 args */
        case node_OR:
            printf("    # Or node switch\n");
            int label_OR = label_count++;
            call(ast->children->val, ast->type, call_name, is_func);
            printf("    bne $v0, $0, True.%d\n", label_OR);
            call(ast->children->next->val, ast->type, call_name, is_func);
            printf("    bne $v0, $0, True.%d\n", label_OR);
            printf("    addi $v0, $0, 0\n");
            printf("    j Done.%d\n", label_OR);
            printf("True.%d:\n", label_OR);
            printf("    addi $v0, $0, 1\n");
            printf("Done.%d:\n", label_OR);
            break;

        /* Plus node: expects 2 args */
        case node_PLUS:
            printf("    # Plus node switch\n");
            printf("    lw $t0, 0($sp)\n");
            printf("    lw $t1, 4($sp)\n");
            printf("    add $v0, $t0, $t1\n");
            break;

        /* Minus node: expects 2 args */
        case node_MINUS:
            printf("    # Minus node switch\n");
            printf("    lw $t0, 0($sp)\n");
            printf("    lw $t1, 4($sp)\n");
            printf("    sub $v0, $t0, $t1\n");
            break;

        /* Multiply node: expects 2 args */
        case node_MUL:
            printf("    # Multiply node switch\n");
            printf("    lw $t0, 0($sp)\n");
            printf("    lw $t1, 4($sp)\n");
            printf("    mult $t0, $t1\n");
            printf("    mflo $v0\n");
            break;

        /* Less than node: expects 2 args*/
        case node_LT:
            printf("    # Less than node switch\n");
            printf("    lw $t0, 0($sp)\n");
            printf("    lw $t1, 4($sp)\n");
            printf("    slt $v0, $t0, $t1\n");
            break;

        /* Equals to node: expects 2 args */
        case node_EQ:
            printf("    # Equals node switch\n");
            int label = label_count++;
            printf("    lw $t0, 0($sp)\n");
            printf("    lw $t1, 4($sp)\n");
            printf("    beq $t0, $t1, True.%d\n", label);
            printf("    beq $0, $0, False.%d\n", label);
            printf("True.%d:\n", label);
            printf("    li $v0, 1\n");
            printf("    beq $0, $0, Done.%d\n", label);
            printf("False.%d:\n", label);
            printf("    li $v0, 0\n");
            printf("Done.%d:\n", label);
            break;

        /* Divide node: expects 2 args */
        case node_DIV:
            printf("    # Divide node switch\n");  
            printf("    lw $t0, 0($sp)\n");
            printf("    lw $t1, 4($sp)\n");
            printf("    div $t0, $t1\n");
            printf("    mflo $v0\n");
            break;

        /* Function call, function definitions defined in below function. */
        case node_FUNCTION:
            return;

        /* Struct node: is only dealt with when assigning or arrowing,
        and therefore is either a repeated assign statement, or in
        'arrow' case, simply returns the value in a given struct. */
        case node_STRUCT:
            printf("    # Struct node switch\n");
            printf("    move $v0, $sp\n");
            printf("# Leaving struct\n");
            return;

        /* Arrow node: expects 2 args */
        case node_ARROW:
            printf("    # Arrow node switch\n");
            /* global variable struct */
            if (ast->children->val->type == node_VAR && !is_func) {
                printf("    la $t0, struct.%s\n", ast->children->val->val);
                printf("    lw $v0, %d($t0)\n", atoi(ast->children->next->val->val) * 4);
            } else if (ast->children->val->type == node_VAR) {
                char struct_name[(int)(strlen(call_name) + strlen(ast->children->val->val) + 9)];
                sprintf(struct_name, "struct.%s.%s", call_name, ast->children->val->val);
                printf("    lw $v0, %d($fp)\n", (atoi(ast->children->next->val->val) + smap_get(decls, struct_name)) * 4);
            } else {
                printf("    lw $v0, %d($sp)\n", (atoi(ast->children->next->val->val) * 4));
            }
            break;

        /* Assign node: expects 2 args */
        case node_ASSIGN:
            printf("    # Assign node switch\n");
            /* global variable assign */
            if (!is_func){

                if (ast->children->next->val->type == node_STRING){
                    printf("    la $t0, str.%d\n", smap_get(strings, ast->children->next->val->val));
                    printf("    sw $t0, %s\n", ast->children->val->val);
                    printf("    move $v0, $t0\n");

                } else if (ast->children->next->val->type == node_STRUCT) {
                    int struct_index = 0;
                    printf("    la $t0, struct.%s\n", ast->children->val->val);
                    while (struct_index < (int) AST_lst_len(ast->children->next->val->children)) {
                        printf("    lw $t1, %d($sp)\n", struct_index * 4);
                        printf("    sw $t1, %d($t0)\n", struct_index * 4);
                        struct_index ++;
                    }
                    printf("    move $v0, $t0\n");

                } else {
                    printf("    lw $t0, 0($sp)\n");
                    printf("    sw $t0, %s\n", ast->children->val->val);
                    printf("    move $v0, $t0\n");
                }
            /* local variable assign */
            } else {

                if (ast->children->next->val->type == node_STRING) {
                    printf("    la $t0, str.%d\n", smap_get(strings, ast->children->next->val->val));
                    printf("    sw $t0, %d($sp)\n", sp_index * 4);

                } else if (ast->children->next->val->type == node_STRUCT) {
                    int struct_position = 0;
                    char struct_name[(int)(strlen(call_name) + strlen(ast->children->val->val) + 9)];
                    sprintf(struct_name, "struct.%s.%s", call_name, ast->children->val->val);
                    int arg_index = smap_get(decls, struct_name);
                    printf("    la $v0, %d($fp)\n", arg_index * 4);
                    while (struct_position < (int) AST_lst_len(ast->children->next->val->children)){
                        printf("    lw $t0, %d($sp)\n", struct_position * 4);
                        printf("    sw $t0, %d($fp)\n", arg_index * 4);
                        struct_position++;
                        arg_index++;
                    }

                } else {
                    char name[(int)(strlen(call_name) + (strlen(ast->children->val->val)) + 2)];
                    sprintf(name, "%s.%s", call_name, ast->children->val->val);
                    printf("    lw $t0, 0($sp)\n");
                    printf("    sw $t0, %d($fp)\n", smap_get(decls, name) * 4);
                    printf("    move $v0, $t0\n");
                }
            }
            break;

        /* If node: expects 3 arg */
        case node_IF:
            printf("    # If node switch\n");
            int label_IF = label_count++;
            call(ast->children->val, ast->type, call_name, is_func);
            printf("    bne $v0, $0, True.%d\n", label_IF);
            printf("    beq $0, $0, False.%d\n", label_IF);
            printf("True.%d:\n", label_IF);
            call(ast->children->next->val, ast->type, call_name, is_func);
            printf("    beq $0, $0, Done.%d\n", label_IF);
            printf("False.%d:\n", label_IF);
            call(ast->children->next->next->val, ast->type, call_name, is_func);
            printf("Done.%d:\n", label_IF);
            break;

        /* While node: expects 2 args */
        case node_WHILE:
            printf("    # While node switch\n");
            int label_WHILE = label_count++;
            printf("While.%d:\n", label_WHILE);
            call(ast->children->val, ast->type, call_name, is_func);
            printf("    beq $v0, $0, Done.%d\n", label_WHILE);
            call(ast->children->next->val, ast->type, call_name, is_func);
            printf("    j While.%d\n", label_WHILE);
            printf("Done.%d:\n", label_WHILE);
            printf("    move $v0, $0\n");
            break;

        /* For node: expects 4 args */
        case node_FOR:
            printf("    # For node switch\n");
            int label_FOR = label_count++;
            call(ast->children->val, ast->type, call_name, is_func);
            printf("For.%d:\n", label_FOR);
            call(ast->children->next->val, ast->type, call_name, is_func);
            printf("    beq $v0, $0, Done.%d\n", label_FOR);
            call(ast->children->next->next->next->val, ast->type, call_name, is_func);
            call(ast->children->next->next->val, ast->type, call_name, is_func);
            printf("    beq $0, $0, For.%d\n", label_FOR);
            printf("Done.%d:\n", label_FOR);
            printf("    move $v0, $0\n");
            break;

        /* Sequence node: expects * args */
        case node_SEQ:
            printf("    # Sequence node switch\n");
            printf("    lw $v0, %d($sp)\n", (sp_index - 1) * 4);
            break;

        /* Int print node: expects 1 arg */
        case node_I_PRINT:
            printf("    # Int print node switch\n");
            printf("    lw $a0, 0($sp)\n");
            printf("    li $v0, 1\n");
            printf("    syscall\n");
            printf("    move $v0, $0\n");
            break;

        /* String print node: expects 0 args */
        case node_S_PRINT:
            printf("    # String print node switch\n");
            printf("    lw $a0, 0($sp)\n");
            printf("    li $v0, 4\n");
            printf("    syscall\n");
            printf("    move $v0, $0\n");
            break;

        /* Int read node: expects 0 args */
        case node_READ_INT:
            printf("    # Int read node switch\n");
            printf("    li $v0, 5\n");
            printf("    syscall\n");
            break;

        /* Read char node: expects 0 args */
        case node_READ_CHAR:
            printf("    # Read char node switch\n");
            printf("    li $v0, 12\n");
            printf("    syscall\n");
            break;
    }
    /* Restores the memory to the stack. */
    if (stack_restore != 0){
        printf("    addi $sp, $sp, %d\n", stack_restore); 
    }
    printf("    # End clause\n");
    printf("# Leaving %s\n", ast->val);
    return;
}

void emit_exit() {
    printf("    li $v0 10\n");
    printf("    syscall\n");
}

void emit_functions(AST *ast) {
    /* TODO: Implement me. */
    if (ast->type != node_FUNCTION){
        return;
    }
    printf("Func.%s:\n", ast->children->val->val);
    printf("    move $t0, $fp\n");
    printf("    move $fp, $sp\n");
    printf("    addi $sp, $sp, -8\n");
    printf("    sw $ra, 0($sp)\n");
    printf("    sw $t0, 4($sp)\n");
    call(ast->children->next->val, ast->type, ast->children->val->val, 1);
    printf("    lw $ra, 0($sp)\n");
    printf("    lw $fp, 4($sp)\n");
    printf("    addi $sp, $sp, 8\n");
    printf("    jr $ra\n\n");
}


