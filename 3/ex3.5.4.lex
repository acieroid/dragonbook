/*
 * Exercise 3.5.4: Write a Lex program that converts a file to "Pig
 * latin" (described in the exercise, p. 146).
 */
%{
%}

%option noyywrap

delim      [ \t\n]
ws         {delim}+
vowel      [aeiouyAEIOUY]
consonnant [bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ]
letter     ({vowel}|{consonnant})
firstcons  {consonnant}{letter}*
firstvow   {vowel}{letter}*

%%

{firstcons} {printf("%s%cay", yytext+1, yytext[0]);}
{firstvow}  {printf("%say", yytext);}

%%

int main() {
  yylex();
  return 0;
}
