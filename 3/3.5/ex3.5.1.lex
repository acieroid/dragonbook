/**
 * Exercise 3.5.1:
 * a) Add the keyword while
 * b) Change the comparison operators to be the C operators of that kind
 * c) Allow the underscore as an additional letter
 * d) Support strings
 */
%{
enum {
  LT, LE, EQ, NE, GT, GE,
  IF, THEN, ELSE, ID, NUMBER, RELOP,
  WHILE, STRING
};

int yylval = 0;
%}

/* disable use of yacc */
%option noyywrap

/* regular definitions */
delim   [ \t\n]
ws      {delim}+
letter  [A-Za-z_]
digit   [0-9]
id      {letter}({letter}|{digit})*
number  {digit}+(\.{digit}+)?(E[+-]?{digit}+)?
string  \"([^\"]|\\\")*\"

%%

ws       {/* no action and no return */}
if       {return(IF);}
then     {return(ELSE);}
while    {return(WHILE);}
{id}     {/* installID() not defined */ return(ID);}
{number} {/* installNum() not defined */ return(NUMBER);}
{string} {return(STRING);}
"<"      {yylval = LT; return(RELOP);}
"<="     {yylval = LE; return(RELOP);}
"=="     {yylval = EQ; return(RELOP);}
"!="     {yylval = NE; return(RELOP);}
">"      {yylval = GT; return(RELOP);}
">="     {yylval = GE; return(RELOP);}
  
%%

int main() {
  yylex();
  return 0;
}
