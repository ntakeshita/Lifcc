#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include "lexer.h"
#include "util/util.h"
#include "parser.h"

#define INIT_BUFFER_SIZE 256

void init_lex(lexer *luthor) {
    luthor->file = NULL;
    luthor->buffer = NULL;
    luthor->type = token_SENTINEL;
    luthor->buff_len = 0;
}

void open_file(lexer *lex, char *filename) {
    if (lex) {
       lex->file = fopen(filename, "r");
       if (!lex->file) {
           fatal_error("Could not read input file.\n");
       }
       lex->buff_len = INIT_BUFFER_SIZE;
       lex->buffer = safe_calloc(INIT_BUFFER_SIZE * sizeof(char));
    }
}

void close_file(lexer *lex) {
    if (lex) {
        fclose(lex->file);
        free(lex->buffer);
        lex->buff_len = 0;
        lex->buffer = NULL;
    }
}

void read_token(lexer *lex) {
    /* TODO: Implement me. */
    /* HINT: fgetc() and ungetc() could be pretty useful here. */
    /* Iterates through the file to find next non-whitespace character */
    int c = fgetc(lex->file);
    while (c != feof(lex->file) && ((char)c == ' ' || (char)c == '\n' || c == 9)){
        c = fgetc(lex->file);
    }

    /* Checks to see if reached end of file while going through the whitespace. */
    if (c == EOF){
        lex->type = token_END;
        free(lex->buffer);
        lex->buffer = NULL;
        return;
    }

    /* Default cases for the lexer '(' or ')'. */
    if ((char)c == '('){
        lex->type = token_OPEN_PAREN;
        lex->buffer[0] = '(';
        lex->buffer[1] = '\0';
    } else if ((char)c == ')') {
        lex->type = token_CLOSE_PAREN;
        lex->buffer[0] = ')';
        lex->buffer[1] = '\0';
    } else {

        /* Keeps track of string length in case of buffer resize, as well
        as whether we found the type of the token yet. */
        int word_length = 0;
        lex->type = token_SENTINEL;

        /* Checks if our token is a string or an int and advances
        fgetc() if a string (first char is a "). */
        if ((char)c == '"') {
            lex->type = token_STRING;
        }

        if ((char)c == '-' || isdigit(c)){
            int temp = fgetc(lex->file);;
            if (isdigit(temp) || isdigit(c)){
                lex->type = token_INT;
            }
            ungetc(temp, lex->file);
        }

        /* Puts the token into the buffer and ends with a null terminator.*/
        while (lex->type == token_STRING || ((char)c != ' ' && (char)c != '\n' && (char)c != '(' && (char)c != ')')){

            /* If int type, makes sure that every sequential term is an int. */
            if (lex->type == token_INT){
                if (c == '-' && word_length == 0){
                }else if (!isdigit(c)){
                    printf("buffer: %s | letter: %c | length: %d\n", lex->buffer, c, word_length);
                    fprintf(stderr, "invalid int syntax: '%c'\n", c);
                    exit(1);
                }
            }

            /* If throughout all its characters, it meets the criteria of a name,
            changed_type remains 0. If it does not meet syntax criteria of a name at any point,
            changes changed_type value to 2. */
            if (lex->type == token_SENTINEL){
                if (!(c == '_' && word_length != 0) && !(isdigit(c) && word_length != 0) 
                && !isalpha(c)){
                    lex->type = token_KEYWORD;
                }
            }

            lex->buffer[word_length++] = (char)c;

            if (lex->type == token_STRING && c == '"' && word_length > 1){
                c = fgetc(lex->file);
                break;
            }

            /* Moves onto next character and checks if at EOF. */
            c = fgetc(lex->file);
            if (c == EOF){
                break;
            }

            /* Reallocates memory if more is needed for token. */
            if (word_length + 1 > lex->buff_len){
                lex->buffer = safe_realloc(lex->buffer, 2 * lex->buff_len * sizeof(char));
                lex->buff_len *= 2;
            }
        }
        ungetc(c, lex->file);
        lex->buffer[word_length] = '\0';

        /* If the changed_type is not 1, then we haven't found a type for the word.
        Thus if it followed all the syntax rules up to this point, changed_type == 0.
        Else it hasn't followed the rules and thus if not a keyword, then must be a syntax
        error. */
        if (lex->type == token_SENTINEL){
            if(!strcmp("None", lex->buffer)){
                lex->type = token_INT;
                lex->buffer[0] = '0';
                lex->buffer[1] = '\0';
            } else if (is_keyword(lex->buffer)){
                lex->type = token_KEYWORD;
            } else if (lex->type == token_SENTINEL){
                lex->type = token_NAME;
            } else {
                fprintf(stderr, "invalid name syntax: %s\n", lex->buffer);
                exit(1);
            }
        }
    }
}

/* Checks if buffer value is keyword. */

int is_keyword(char* buffer){
    return (!strcmp(buffer, "and") || !strcmp(buffer, "or") || !strcmp(buffer, "+")
        || !strcmp(buffer, "-") || !strcmp(buffer, "*") || !strcmp(buffer, "/")
        || !strcmp(buffer, "lt") || !strcmp(buffer, "eq") || !strcmp(buffer, "function")
        || !strcmp(buffer, "struct") || !strcmp(buffer, "arrow") || !strcmp(buffer, "None") 
        || !strcmp(buffer, "assign") || !strcmp(buffer, "if") || !strcmp(buffer, "while") 
        || !strcmp(buffer, "for") || !strcmp(buffer, "sequence") || !strcmp(buffer, "intprint") 
        || !strcmp(buffer, "stringprint") || !strcmp(buffer, "readint"));
}

token_type peek_type(lexer *lex) {
    if (!lex) {
       return token_SENTINEL;
    }
    if (lex->type == token_SENTINEL) {
       read_token(lex);
    }
    return lex->type;
}

char *peek_value(lexer *lex) {
    if (!lex) {
       return NULL;
    }
    if (lex->type == token_SENTINEL) {
       read_token(lex);
    }
    return lex->buffer;
}
