%{
%}

%%
\n          return('\n');
[\t ]+
[a-zA-Z]    {yylval.c = yytext[0]; return(ITEM);}
"("         return('(');
")"         return(')');
","         return(',');
