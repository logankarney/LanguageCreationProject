%{

	#include <stdio.h>
	#include <stdlib.h>
	#include <errno.h>
	#include "zoomjoystrong.h"
	int yyerror(const char* err);
	int yylex();
	extern FILE* yyin;
%}

%token INT
%token FLOAT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token END_PROGRAM
%token END_OF_LINE

%%

program: 	list_of_expr END_PROGRAM
	;

list_of_expr:	expr
	|	list_of_expr expr
	;

expr:	command
	|    END_OF_LINE
	; 

command:	two_var_command
	|	three_var_command
	|	four_var_command
	;

two_var_command: POINT INT INT END_OF_LINE
	;

three_var_command:	CIRCLE INT INT INT END_OF_LINE
	|	SET_COLOR FLOAT FLOAT FLOAT END_OF_LINE
	;	

four_var_command:	LINE INT INT INT INT END_OF_LINE
	|	RECTANGLE INT INT INT INT END_OF_LINE
	;

%%
int main(int argc, char** argv){
	setup();
	yyin = fopen(argv[1], "r");
	yyparse();
	finish();
	return 0;
}

int yyerror(const char* err){
	printf("%s\n", err);
	return 1;
}
