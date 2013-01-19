%{
/**
 * The grammar in question is
 * S -> ( L ) | a
 * L -> L , S | S
 *
 * Write a yacc program that takes lists (with any single character as
 * an element, not just a), and produces as output a linear
 * representation of the same list; i.e., a single list of the
 * elements, in the same order that they appear in the input.
 */

#include <stdlib.h>
#include <stdio.h>

typedef struct list list;
struct list {
  char val;
  list *next;
};

void print_list(list *l) {
  printf("(");
  while (l != NULL) {
    printf("%c", l->val);
    l = l->next;
    if (l != NULL) {
      printf(", ");
    }
  }
  printf(")\n");
}

list *cons_val(char val, list *l) {
  list *new_l = malloc(sizeof *l);
  new_l->val = val;
  new_l->next = l;
  return new_l;
}

list *append(list *l1, list *l2) {
  list *l = l1;
  while (l->next != NULL) {
    l = l->next;
  }

  l->next = l2;
  return l1;
}

%}

%union {
  char c;
  list *l;
}

%token <c> ITEM
%token LPAREN RPAREN COMMA
%type <l> S L

%%

lines : lines S '\n'   { print_list($2); }
      | lines '\n'
      |
      | error '\n'     { yyerror("reenter previous line:\n");
                         yyerrok; }

S : '(' L ')'          { $$ = $2; }
  | ITEM               { $$ = cons_val($1, NULL); }

L : L ',' S            { $$ = append($1, $3); }
  | S                  { $$ = $1; }

%%
#include "lex.yy.c"
