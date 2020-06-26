%{
#include <stdio.h>
%}

%token VERTEX TCOORD NORMAL POLYGON NAME OBJECT_NAME SMOOTH_SHADING MTLLIB USEMTL 
%token STRING DOUBLE LOCATION SLASH
%token COMMENT

%%

comment: COMMENT
{
	printf("This is a comment\n")
}
;

string: STRING
{
	printf("This is something I never looked at, I should fix that!\n");
}
;

vertex: VERTEX coords
{
	printf("This is a vertex\n");
}
;

normal: NORMAL coords
{
	printf("This is a normal\n");
}
;

tcoord: TCOORD coords
{
	printf("This is a texture coordinate\n");
}
;

triangle: POLYGON v v v
| POLYGON vt vt vt
| POLYGON vn vn vn
| POLYGON vtn vtn vtn
{
	printf("This is a triangle polygon");
}
;

rectangle: POLYGON v v v v
| POLYGON vt vt vt vt
| POLYGON vn vn vn vn
| POLYGON vtn vtn vtn vtn
{
	printf("This is a rectangle polygon");
}
;

coords: DOUBLE DOUBLE DOUBLE DOUBLE
|	DOUBLE DOUBLE DOUBLE
|	DOUBLE DOUBLE
;

v: LOCATION
;

vt: LOCATION SLASH LOCATION
;

vn: LOCATION SLASH SLASH LOCATION
;

vtn: LOCATION SLASH LOCATION SLASH LOCATION
;

%%

int yyerror(char *s){
	fprintf(stderr,"YYERROR: %s\n",s);
	return 0;
}

int yywrap(){
	return 1;
}

extern FILE *yyin;

int main(int argc, char** argv){
	yyin = fopen(argv[1],"r");

	yyparse();

	return 0;
}