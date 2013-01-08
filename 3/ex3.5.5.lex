/**
 * Exercise 3.5.5: Write a Lex program that recognizes the keywords
 * SELECT, FROM, and WHERE (in any combination of capital and
 * lower-case letters), and token ID.
 */
%{
enum {
  SELECT, FROM, WHERE, ID
};

int yylval = 0;
%}

%option noyywrap

/* I guess that's not the best way to do it... */
A [aA]
B [bB]
C [cC]
D [dD]
E [eE]
F [fF]
G [gG]
H [hH]
I [iI]
J [jJ]
K [kK]
L [lL]
M [mM]
N [nN]
O [oO]
P [pP]
Q [qQ]
R [rR]
S [sS]
T [tT]
U [uU]
V [vV]
W [wW]
X [xX]
Y [yY]
Z [zZ]

SELECT {S}{E}{L}{E}{C}{T}
FROM   {F}{R}{O}{M}
WHERE  {W}{H}{E}{R}{E}
letter [a-zA-Z]
digit  [0-9]
ID     {letter}({letter}|{digit})*

%%

{SELECT}  {yylval = SELECT;}
{FROM}    {yylval = FROM;}
{WHERE}   {yylval = WHERE;}
{ID}      {yylval = ID;}
%%


/**
 * To install symbols in a symbol table, since they are not
 * case-sensitive, they should be first converted to the same case
 * (eg. everything in uppercase), so that two different
 * representations of the same symbol (eg. foo and Foo) would be
 * equal.
 */

int main() {
  yylex();
  return 0;
}
