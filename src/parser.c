#include "parser.h"
#include "lexer.h"
#include <string.h>
#include <stdlib.h>

/** An array of the different string values of keywords. */
char *keywords[] = {"and", "or", "+", "-", "*", "/", "lt", "eq", 
		    "function", "struct", "arrow", "assign", "if", 
		    "while", "for", "sequence", "intprint", "stringprint",
		    "readint"};
/** Sister array of keywords. Keeps track of the corresponding enum. */
int enums[] = {node_AND, node_OR, node_PLUS, node_MINUS, node_MUL, node_DIV,
	       node_LT, node_EQ, node_FUNCTION, node_STRUCT, 
	       node_ARROW, node_ASSIGN, node_IF, node_WHILE, node_FOR, 
	       node_SEQ, node_I_PRINT, node_S_PRINT, node_READ_INT};
/** A hashmap used for more efficient lookups of (keyword, enum) pairs. */
smap *keyword_str_to_enum;

int num_global_var;
int num_struct;

/** Initializes keyword_str_to_enum so that it contains a map
 *  from the string value of a keyword to its corresponding enum. */
void initialize_keyword_to_enum_mapping();


void parse_init() {
    num_global_var = 0;
    num_struct = 0;
    decls = smap_new();
    stack_sizes = smap_new();
    num_args = smap_new();
    strings = smap_new();
    keyword_str_to_enum = smap_new();

    /* Adding all keywords to the num_args list for use in check tree shape. */
    smap_put(num_args, "and", 2);
    smap_put(num_args, "or", 2);
    smap_put(num_args, "+", 2);
    smap_put(num_args, "-", 2);
    smap_put(num_args, "*", 2);
    smap_put(num_args, "/", 2);
    smap_put(num_args, "lt", 2);
    smap_put(num_args, "eq", 2);
    smap_put(num_args, "function", 2);
    smap_put(num_args, "struct", -2);
    smap_put(num_args, "arrow", 2);
    smap_put(num_args, "assign", 2);
    smap_put(num_args, "if", 3);
    smap_put(num_args, "while", 2);
    smap_put(num_args, "for", 4);
    smap_put(num_args, "sequence", -2);
    smap_put(num_args, "intprint", 1);
    smap_put(num_args, "stringprint", 1);
    smap_put(num_args, "readint", 0);

}

void parse_close() {
    smap_del_contents(decls);
    smap_del(decls);
    smap_del(stack_sizes);
    smap_del(num_args);
    smap_del(strings);
    smap_del(keyword_str_to_enum);
}


AST *build_ast (lexer *lex) {
    /* TODO: Implement me. */
    /* Hint: switch statements are pretty cool, and they work 
     *       brilliantly with enums. */

    /* If doesn't begin with a '(', then improperly formed, and thus
    throw error. */

    if (strcmp(peek_value(lex), "(")){ 
        if (peek_type(lex) >= 4){
            fprintf(stderr, "improperly formed experession didn't start with '('\n");
            exit(1);
        }else{
            AST* curr_AST = safe_calloc(sizeof(AST));
            curr_AST->val = safe_calloc((strlen(peek_value(lex)) + 1) * sizeof(char));
            curr_AST->val = strcpy(curr_AST->val, peek_value(lex));
            curr_AST->type = (peek_type(lex) == 3) ? lookup_keyword_enum(peek_value(lex)) : (node_type)(peek_type(lex));
            curr_AST->children = NULL;
            curr_AST->last_child = NULL;
            read_token(lex);
            return curr_AST;
        }
    }

    int not_paren = 1;
    read_token(lex);
    AST* curr_AST = safe_calloc(sizeof(AST));

    /* Intializes value and type of current AST. If it is not a keyword or a
    name following the beginning then inproper syntax. */
    if (peek_type(lex) == 3){
        curr_AST->type = lookup_keyword_enum(peek_value(lex));
        curr_AST->val = safe_calloc((strlen(peek_value(lex)) + 1) * sizeof(char));
        strcpy(curr_AST->val, peek_value(lex));
    } else if (peek_type(lex) == 2) {
        curr_AST->type = node_CALL;
        curr_AST->val = safe_calloc((strlen(peek_value(lex)) + 1) * sizeof(char));
        strcpy(curr_AST->val, peek_value(lex));
    }else{
        fprintf(stderr, "inproper syntax following parenthesis, found '%s'\n", peek_value(lex));
        exit(1);
    }

    read_token(lex);

    /* Initializes children to null. */
    curr_AST->children = NULL;
    curr_AST->last_child = NULL;

    while (peek_type(lex) != token_END && strcmp(peek_value(lex),")")){

        AST* child_AST;
        /* Iterates through checking the type of the current token and adds
        them as children to the curr_AST. If we encounter another parenthesis,
        recursively enter a new build_AST(). */ 

        switch (peek_type(lex)){

            case token_INT:
                child_AST = safe_calloc(sizeof(AST));   
                child_AST->type = node_INT;
                break;

            case token_STRING:
                child_AST = safe_calloc(sizeof(AST));
                child_AST->type = node_STRING;
                break;

            case token_NAME:
                child_AST = safe_calloc(sizeof(AST));
                child_AST->type = node_VAR;
                break;

            case token_KEYWORD:
                fprintf(stderr, "keyword cannot be used as an argument\n");
                exit(1);

            case token_OPEN_PAREN:
                child_AST = build_ast(lex);
                not_paren = 0;
                break;

            default:
                fprintf(stderr, "type of: '%s' undetermined\n", peek_value(lex));
                exit(1);
        }


        /* Assigns string values to the node and sets the children to null,
        since in all the above cases, they are just ints, strings, names, or keywords,
        and thus will have no children, since they are already children to curr_AST. */

        if (not_paren){
            fflush(stdout);
            child_AST->val = safe_calloc((strlen(peek_value(lex)) + 1) * sizeof(char));
            child_AST->children = NULL;
            child_AST->last_child = NULL;
            strcpy(child_AST->val, peek_value(lex));
        }

        /* Assigns it to the children list. If it is the first child, callocs space
        for the AST_lst and if it is not our first child then we realloc space and
        append it to the end of the list. */

        if (curr_AST->children == NULL){
            curr_AST->children = safe_calloc(sizeof(AST_lst));
            curr_AST->children->val = child_AST;
            curr_AST->children->next = NULL;
            curr_AST->last_child = curr_AST->children; 
        }else{
            AST_lst* next_node = safe_calloc(sizeof(AST_lst));
            curr_AST->last_child->next = next_node;
            curr_AST->last_child = next_node;
            curr_AST->last_child->next = NULL;
            next_node->val = child_AST;
        }

        if (peek_value(lex) == NULL){
            fprintf(stderr, "parenthesis unaligned, exiting\n");
            exit(1);
        }
        if (!strcmp(peek_value(lex), "(")){
            continue;
        }

        if (!strcmp(peek_value(lex), ")")){
            break;
        }

        if (strcmp(peek_value(lex), child_AST->val) && not_paren == 0){
            not_paren = 1;
            continue;
        }

        read_token(lex);
    }

    /* If doesn't end with a ')', then improperly formed, and thus
    throw error. Otherwise, read the next token and return the AST. */
    if (strcmp(peek_value(lex), ")")){
        fprintf(stderr, "improperly formed expression, didn't end with ')'\n");
        exit(1);
    }
    read_token(lex);
    return curr_AST;
}

void print_ast(AST* a, int level){
    for (int i = 0; i < level; i ++){
        printf("-");
        fflush(stdout);
    }
    printf("val: '%s' - type: '%d' |", a->val, a->type);
    fflush(stdout);
    if (a->children != NULL){
        AST_lst* nxt = a->children;
        while (nxt != NULL){
            print_ast(nxt->val, level + 1);
            printf(" ");
            fflush(stdout);
            nxt = nxt->next;
        }
    }
    if (level == 0){
        printf("\n");
    }
}

void free_ast (AST *ptr) {
    /* TODO: Implement me. */
    AST_lst* child_ptr = ptr->children;
    AST_lst* prev = ptr->children;
    while (child_ptr != NULL) {
        free_ast(child_ptr->val);
        child_ptr = child_ptr->next;
        free(prev);
        prev = child_ptr;
    }
    free(ptr->val);
    free(ptr);
}

void check_tree_shape(AST *ptr) {
    /* TODO: Implement me. */
    /* Hint: This function is just asking to be table-driven */

    int fn_args = smap_get(num_args, ptr->val);
    if (fn_args != -1 && ptr->type != node_VAR){

        /* Checks the arguments of names and makes sure that they are proper,
        and if they are a function, then check whether the name is legal. */
        if (ptr->type == node_FUNCTION){
            if ((int) AST_lst_len(ptr->children) == fn_args
            && ptr->children->val->type == node_CALL
            && smap_get(num_args, ptr->children->val->val) == -1){
                if ((int) AST_lst_len(ptr->children->val->children) > 0){
                    AST_lst* child_ptr = ptr->children->next;
                    for (int i = 0; i < ((int)AST_lst_len(ptr->children->val->children)) - 1; i++){
                        check_tree_shape(child_ptr->val);
                        child_ptr = child_ptr->next;
                    }
                }
            }else{
                fprintf(stderr, "function's name is not proper\n");
                exit(1);
            }

        /* A check for a variable amount of arguments. */

        } else if (fn_args == -2){
            if ((int) AST_lst_len(ptr->children) > 0){
                AST_lst* child_ptr = ptr->children;
                for (int i = 0; i < (int) AST_lst_len(ptr->children); i++){
                    check_tree_shape(child_ptr->val);
                    child_ptr = child_ptr->next;
                } 
            }else if (ptr->type == node_SEQ){
                fprintf(stderr, "Sequence requires at least one expression. \n");
                exit(1);
            }

        /* Every other default case. */
        } else if (ptr->type != node_FUNCTION && (int) AST_lst_len(ptr->children) == fn_args) {
            AST_lst* child_ptr = ptr->children;
            for (int i = 0; i < fn_args; i++){
                check_tree_shape(child_ptr->val);
                child_ptr = child_ptr->next;
            }
            return;
        } else {
            fprintf(stderr, "'%s' does not have the right amount of arguments, and has %d arguments.\n", ptr->val, (int) AST_lst_len(ptr->children));
            exit(1);
        }
    }
}

int check_assign(AST* ast, char* env) {
    if (ast->type == node_ASSIGN) {
        if (ast->children->val->type == node_STRUCT) {
            if (strlen(env) > 0) {
                char name[strlen(env) + strlen(ast->children->val->val) + 9];
                sprintf(name, "struct.%s.%s", env, ast->children->val->val);
                if (smap_get(decls, name) == -1) {
                    return 0;
                }

            } else {
                char name[strlen(ast->children->val->val) + 8];
                sprintf(name, "struct.%s", ast->children->val->val);
                if (smap_get(decls, name) == -1) {
                    return 0;
                }
            }
        } else {
            if (strlen(env) > 0) {
                char name[strlen(env) + strlen(ast->children->val->val) + 2];
                sprintf(name, "%s.%s", env, ast->children->val->val);
                if (smap_get(decls, name) == -1) {
                    return 0;
                }
            } else {
                if (smap_get(decls, ast->children->val->val) == -1) {
                    return 0;
                }
            }
        }
    }
    if (ast->children == NULL) {
        return 1;
    } else {
        int check = 1;
        AST_lst* child_ptr = ast->children;
        while (child_ptr != NULL) {
            check = check && check_assign(child_ptr->val, env);
            child_ptr = child_ptr->next;
        }
        return check;
    }
}

void gather_decls(AST *ast, char *env, int is_top_level) {
    /* TODO: Implement me. */
    /* Hint: switch statements are pretty cool, and they work 
     *       brilliantly with enums. */

    /* Variables and arguments nested are named in the following scheme:
        <function name>:<variable name>
    In order to access the frame we can use strstr(), to check if the frame
    is there and then use it again to access the variable name. */

    /* Checks whether at the top level and if it is then, save
    to its repsective hashtable by name. */
    if (ast->type == node_AND || ast->type == node_OR || ast->type == node_IF 
            || ast->type == node_FOR || ast->type == node_WHILE) {
        if (ast->type == node_FOR && !check_assign(ast->children->next->next->next->val, env)) {
            fprintf(stderr, "assign declaration present in body of for loop\n");
            exit(1);
        } else if (ast->type == node_WHILE && !check_assign(ast->children->next->val, env)) {
            fprintf(stderr, "assign declaration present in body of while loop\n");
            exit(1);
        } else if (ast->type == node_IF && (!check_assign(ast->children->val, env) 
            || !check_assign(ast->children->val, env))) {
            fprintf(stderr, "assign declaration present in branch of if statement\n");
            exit(1);
        } else if (!check_assign(ast, env)) {
            fprintf(stderr, "assign declaration present in logic gate\n");
            exit(1);
        }
    }
    if (is_top_level){
        if (ast->type == node_ASSIGN) {
            /* If on top, level then global variable and thus treat it
            as always in scope. */
            if (ast->children->next->val->type == node_STRUCT){
                char* assign_name = (char*) safe_calloc(sizeof(char) * (strlen(ast->children->val->val) + 8));
                sprintf(assign_name, "struct.%s", ast->children->val->val);
                smap_put(decls, assign_name, (int) AST_lst_len(ast->children->next->val->children));
                AST_lst* child_ptr = ast->children->next;
                while (child_ptr != NULL){
                    if (child_ptr->val->type == node_STRUCT) {
                        gather_decls(child_ptr->val, ast->children->val->val, 1);
                    } else {
                        gather_decls(child_ptr->val, "", 1);
                    }
                    child_ptr = child_ptr->next;
                }
            } else {
                gather_decls(ast->children->next->val, "", 1);
                char* assign_name = (char*) safe_calloc(sizeof(char) * (strlen(ast->children->val->val) + 1));
                strcpy(assign_name, ast->children->val->val);
                smap_put(decls, assign_name, num_global_var++);
            }
        } else if (ast->type == node_FUNCTION) {

            /* If the node is a function, then assigns the function to the num_args smap,
            and then looks at all its arguments and assigns them into the smap. */

            int stack_size = 0;
            AST* func_def = ast->children->val;
            smap_put(num_args, func_def->val, (int) AST_lst_len(func_def->children));
            AST_lst* child_ptr = func_def->children;

            /* Loops through the number of arguments in the function. */

            while (child_ptr != NULL){
                char* arg_name = (char*)safe_calloc(sizeof(char) * (strlen(child_ptr->val->val) + strlen(func_def->val) + 2));
                sprintf(arg_name, "%s.%s", func_def->val, child_ptr->val->val);
                smap_put(decls, arg_name, stack_size++);
                child_ptr = child_ptr->next;
            }
            smap_put(stack_sizes, func_def->val, stack_size);
            /* Calls gather_decls on the function body and then stores
            the stack size at the end. */

            gather_decls(ast->children->next->val, func_def->val, 0);

        } else if (ast->type == node_CALL || ast->type > 3) {

            /* Checks user defined functions. Below checks if the call 
            is currently in the hashtable */

            if (smap_get(num_args, ast->val) == -1){
                fprintf(stderr, "couldn't find function, '%s'\n", ast->val);
                exit(1);
            }

            /* Global level evaluation of a function. */

            AST_lst *child_ptr = ast->children;
            while (child_ptr != NULL){
                gather_decls(child_ptr->val, "", 1);
                child_ptr = child_ptr->next;
            } 
        } else if (ast->type == node_VAR) {

            /* Checks if the variable pre-exists in the hashtable. */
            char struct_var[strlen(ast->val) + 8];
            sprintf(struct_var, "struct.%s", ast->val);

            if (smap_get(decls, ast->val) == -1 && smap_get(decls, struct_var) == -1){
                fprintf(stderr, "the variable, '%s', could not be found\n", ast->val);
                exit(1);
            }
        } else if (ast->type == node_SEQ) {
            AST_lst* child_ptr = ast->children;
            while (ast->children != NULL) {
                gather_decls(child_ptr->val, "", 1);
                child_ptr = child_ptr->next;
            }
        }

    } else {

        if (ast->type == node_ASSIGN) {
            /* Assigns values for the nested value and then looks into the assign statement. */

            if (ast->children->next->val->type == node_STRUCT){

                char* assign_name = (char*) safe_calloc(sizeof(char) * (strlen(env) + strlen(ast->children->val->val) + 9));
                sprintf(assign_name, "struct.%s.%s", env, ast->children->val->val);

                /* Puts the struct size and stack position in the struct. Labels structs as 'struct.<fn-name>.<var-name>''
                and names the size info as '.struct.<fn-name>.<var-name>' */

                smap_put(decls, assign_name, smap_get(stack_sizes, env));
                smap_put(stack_sizes, env, smap_get(stack_sizes, env) + (int)AST_lst_len(ast->children->next->val->children));
                AST_lst* child_ptr = ast->children->next;
                while (child_ptr != NULL){
                    gather_decls(child_ptr->val, env, 0);
                    child_ptr = child_ptr->next;
                }

            } else {

                /* Adds the local assign to the hash table, with the parent frame function
                leading and then after a '.', the actual function name. */
	            char* assign_name = (char*) safe_calloc(sizeof(char) * (strlen(ast->children->val->val) + strlen(env) + 2));
	        	sprintf(assign_name, "%s.%s", env, ast->children->val->val);
	            smap_put(decls, assign_name, smap_get(stack_sizes, env));
                smap_put(stack_sizes, env, smap_get(stack_sizes, env) + 1);
                gather_decls(ast->children->next->val, env, 0);
            }

        } else if (ast->type == node_FUNCTION) {
            /* Illegal to declare function when not in global frame. */

            fprintf(stderr, "Nested functions are not allowed.");
            exit(1);

        } else if (ast->type == node_CALL || ast->type > 3){
            /* Checks that called functions pre-exist. */

            if (smap_get(num_args, ast->val) == -1){
                fprintf(stderr, "cannot find the function. '%s'\n", ast->val);
                exit(1);
            }

            AST_lst *child_ptr = ast->children;
            while (child_ptr != NULL){
                gather_decls(child_ptr->val, env, 0);
                child_ptr = child_ptr->next;
            } 

        } else if (ast->type == node_VAR){
            /* Checks to determine whether the variable pre-exists. */
            char* local_var = (char*) safe_calloc(sizeof(char) * (strlen(ast->val) + strlen(env) + 2));
            char* struct_var = (char*) safe_calloc(sizeof(char) *(strlen(ast->val) + strlen(env) + 9));
            sprintf(local_var, "%s.%s", env, ast->val);
            sprintf(struct_var, "struct.%s.%s", env, ast->val);
            if (smap_get(decls, local_var) == -1 && smap_get(decls, struct_var) == -1){
                fprintf(stderr, "cannot find the variable with the name. '%s'\n", ast->val);
                exit(1);
            }
            free(local_var);
            free(struct_var);

        } else if (ast->type == node_SEQ) {
            AST_lst* child_ptr = ast->children;
            while (child_ptr != NULL) {
                gather_decls(child_ptr->val, env, 0);
                child_ptr = child_ptr->next;
            }
        }
    }
    
}

node_type lookup_keyword_enum(char *str) {
    if (smap_get(keyword_str_to_enum, keywords[0]) == -1) {
	   initialize_keyword_to_enum_mapping();
    }
    return smap_get(keyword_str_to_enum, str);
}

void initialize_keyword_to_enum_mapping() {
    /* Note that enums is an *array*, not a pointer, so this
     * sizeof business is reasonable. */
    size_t num_keywords = sizeof(enums) / sizeof(int);
    for (size_t i = 0; i < num_keywords; i += 1) {
	smap_put(keyword_str_to_enum, keywords[i], enums[i]);
    }
}

size_t AST_lst_len(AST_lst *lst) {
    int num_fields = 0;
    while (lst) {
	num_fields += 1;
	lst = lst->next;
    }
    return num_fields;
}





smap *decls;
smap *stack_sizes;
smap *num_args;
smap *strings;
