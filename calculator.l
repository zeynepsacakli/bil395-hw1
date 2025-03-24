%{
#include "calculator.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { yylval.val = atoi(yytext); return NUMBER; }
[ \t]+    { /* ignore  */ }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
.           { printf("%s invalid",yytext); }
\n          {return 0 ;}
%%

int yywrap() {
    return 1;
}

