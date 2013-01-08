/*
 * Exercise 3.5.2: Write a Lex program that copies a file, replacing
 * each non-empty sequence of white space by a single blank
 */
%{
%}

%option noyywrap

%%

[ \t]+ {printf(" ");}
[ \n]+ {printf("\n");}

%%

int main() {
  yylex();
  return 0;
}
