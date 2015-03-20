#ifndef PARSER_H
#define PARSER_H

#include "util/smap.h"
#include "util/util.h"
#include "lexer.h"

typedef enum node_type {node_INT /* integer literal */,
			node_STRING /* string literal*/,
			node_VAR /* Name of a variable or a function. */,
			node_CALL /* A call to a function */,
			/* The different built-in utilities. */
			node_AND, node_OR, node_PLUS, node_MINUS, node_MUL,
			node_LT, node_EQ, node_DIV, node_FUNCTION, 
			node_STRUCT, node_ARROW, node_ASSIGN, node_IF, 
			node_WHILE, node_FOR, node_SEQ, node_I_PRINT, 
			node_S_PRINT, node_READ_INT, node_READ_CHAR} node_type;

typedef struct AST AST;
typedef struct AST_lst AST_lst;

struct AST {
    node_type type; /* The type of  */
    char *val; /* The source text which spawned this node. */ 
    AST_lst *children; /* A list of all of the children of this node */
    AST_lst *last_child; /* A minor kludge to avoid O(n) insertion times. */
};

struct AST_lst {
    AST *val;
    AST_lst *next;
};

/** Initializes all global data structures that the parser needs. */
void parse_init();
/** Destroys any global data structures that the parser needed or created. */
void parse_close();
/** Builds an abstract syntax tree from the tokens supplied by LEX. */
AST *build_ast(lexer *lex);
void print_ast(AST* a, int level);
/** Frees the memory allocated to the abstract syntax tree pointed at
 *  by PTR. */
void free_ast(AST *ptr);
/** checks that each node of PTR has an appropriate number of children for its type. */
void check_tree_shape(AST *ptr);
/** Gathers all of the declarations made in AST, and checks for use-before-assign
 *  errors. Assumes that AST is a subtree of the tree defintion of ENV_FUNC. 
 *  IS_TOP_LEVEL should only be set in the event that AST is not a subtree of any other
 *  abstract syntax tree. */
int check_assign(AST* ast, char* env);
void gather_decls(AST *ast, char *env_func, int is_top_level);
/** Returns the node_type corresponding to the string STR, or -1 if no node_type 
 *  corresponds. */
node_type lookup_keyword_enum(char *str);
/** Returns the number of nodes in LST. */
size_t AST_lst_len(AST_lst *lst);


extern smap *decls;
/** Maps from function names to the size of their stack frames. */
extern smap *stack_sizes;
/** Maps from function names to the number of arguments they expect. */
extern smap *num_args;
/** Holds a reference to each of the different string literals appearing throughout 
 *  the program. */
extern smap *strings;

#endif
