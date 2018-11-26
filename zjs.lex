%{
    #include <stdio.h>
    int line = 1;
%}

%%

END			{ printf("END_PROGRAM\n");}
;			{ printf("END_STATEMENT\n");}
POINT		{ printf("POINT\n");}
LINE			{ printf("LINE\n");}
CIRCLE		{ printf("CIRCLE\n");}
RECTANGLE		{ printf("RECTANGLE\n");}
SET_COLOR		{ printf("SET_COLOR\n");}
[0-9]+		{ printf("INT\n");}
[0-9]*\.[0-9]+	{ printf("FLOAT\n");}
\n			{ line++;}
[\t|[:space:]]+	;
.			{ printf("Error at line %d\n", line);}

%%

int main(int argc, char** argv){
  yylex();
  return 0;
}
