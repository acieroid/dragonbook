/*
 * Exercise 3.5.3: Write a Lex program that copies a file, replacing
 * each non-empty sequence of white space by a single blank
 */
%{
%}

%option noyywrap

%%

float {printf("double");}

%%

int main() {
  yylex();
  return 0;
}
