%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
int result;
%}
%union {int val;}
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN
%token <val> NUMBER 
%left PLUS MINUS
%left TIMES DIVIDE
%right UMINUS  
%type <val> expr
%%

input : 
	expr { result = $1 ; }
	;
	
expr: expr PLUS expr        { $$ = $1 + $3;  }
    | expr MINUS expr       { $$ = $1 - $3;  }
    | expr TIMES expr       { $$ = $1 * $3;  }
    | expr DIVIDE expr      { 
                                  if ($3 == 0) {
                                      yyerror("division by zero");
                                      exit(1);
                                  }
                                  $$ = $1 / $3; 
                                  
                              }
    | LPAREN expr RPAREN    { $$ = $2; }
    | MINUS expr %prec UMINUS { $$ = -$2;  }
    | NUMBER                { $$ = $1; }
    ;

%%

//error için 
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
//main islemlerin yapildigi
int main() {
    printf("Enter expressions :\n");
    
    while(1){
    
        if (yyparse() == 0) {
         
        	printf("Result: %d\n",result);
         }
         else break ;
    }
    return 0;
}

