%{
/**
 * The grammar is (ex. 4.2.2.g) :
 * bexpr -> bexpr or bterm | bterm
 * bterm -> bterm and bfactor | bfactor
 * bfactor -> not bfactor | ( bexpr ) | true | false
 */
#include <stdio.h>
#define YYSTYPE int

%}

%token TRUE FALSE AND OR NOT

%%

lines : lines bexpr '\n'  { printf("%s\n", $2 ? "true" : "false"); }
      | lines '\n'
      |
      | error '\n'        { yyerror("reenter previous line:");
                            yyerrok; }

bexpr : bexpr OR bterm    { $$ = $1 || $3; }
      | bterm             { $$ = $1; }
bterm : bterm AND bfactor { $$ = $1 && $3; }
      | bfactor           { $$ = $1; }
bfactor : NOT bfactor     { $$ = ! $2; }
        | '(' bexpr ')'   { $$ = $2; }
        | TRUE            { $$ = 1; }
        | FALSE           { $$ = 0; }

%%

#include "lex.yy.c"
