%{
%}

%%
\n        {return('\n');}
[\t ]+    {}
"true"    {return(TRUE);}
"false"   {return(FALSE);}
"and"     {return(AND);}
"or"      {return(OR);}
"not"     {return(NOT);}
"("       {return('(');}
")"       {return(')');}
%%
    
