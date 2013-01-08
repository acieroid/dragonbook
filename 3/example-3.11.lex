%{
enum {
  LT, LE, EQ, NE, GT, GE,
  IF, THEN, ELSE, ID, NUMBER, RELOP
};

int yylval = 0;
%}

/* disable use of yacc */
%option noyywrap

/* regular definitions */
delim   [ \t\n]
ws      {delim}+
letter  [A-Za-z]
digit   [0-9]
id      {letter}({letter}|{digit})*
number  {digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%

ws       {/* no action and no return */}
if       {return(IF);}
then     {return(ELSE);}
{id}     {/* installID() not defined */ return(ID);}
{number} {/* installNum() not defined */ return(NUMBER);}
"<"      {yylval = LT; return(RELOP);}
"<="     {yylval = LE; return(RELOP);}
"="      {yylval = EQ; return(RELOP);}
"<>"     {yylval = NE; return(RELOP);}
">"      {yylval = GT; return(RELOP);}
">="     {yylval = GE; return(RELOP);}
  
%%

int main() {
  yylex();
  return 0;
}
