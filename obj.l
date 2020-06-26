%{

/* The lex part */
#include "y.tab.h"
%}

%%

[\t\n ]+ ;

\\ {
	printf("%s is a SLASH\n",yytext);
	return SLASH;
}

^#.* {
	printf("%s is a COMMENT\n",yytext);
	return COMMENT;
}


^v {
	printf("%s is a VERTEX\n",yytext);
	return VERTEX;
}

^vt {
	printf("%s is a TCOORD\n",yytext);
	return TCOORD;
}

^vn {
	printf("%s is a NORMAL\n",yytext);
	return NORMAL;
}

^f {
	printf("%s is a POLYGON\n",yytext);
	return POLYGON;
}

[a-zA-Z]+ {
	printf("%s is a STRING\n",yytext);
	return STRING;
}

[0-9]+\.[0-9]+ {
	printf("%s is a DOUBLE\n",yytext);
	return DOUBLE;
}
[0-9]+ {
	printf("%s is a LOCATION\n",yytext);
	return LOCATION;
}

.

%%