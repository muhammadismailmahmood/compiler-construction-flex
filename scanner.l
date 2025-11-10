%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFIER: %s\n", yytext); }
[0-9]+                   { printf("NUMBER: %s\n", yytext); }
.                        { printf("UNKNOWN: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}

