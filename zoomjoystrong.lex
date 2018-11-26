%{
    #include <stdio.h>
	#include "zoomjoystrong.h"
	#include "zoomjoystrong.tab.h"
    int cur_line = 1;
%}

%%

(END)			{ return (END_PROGRAM);}
(;)				{ return (END_OF_LINE);}
(POINT)			{ return (POINT);}
(LINE)			{ return (LINE);}
(CIRCLE)			{ return (CIRCLE);}
(RECTANGLE)		{ return (RECTANGLE);}
(SET_COLOR)		{ return (SET_COLOR);}
[0-9]+			{ return (INT);}
[0-9]*\.[0-9]+		{ return (FLOAT);}
\n				{ cur_line++;}
[\t|[:space:]]+	;
.				{ printf("Error at line %d\n"), cur_line;}

%%

/*int main(int argc, char** argv){
  yylex();
  return 0;
}*/
