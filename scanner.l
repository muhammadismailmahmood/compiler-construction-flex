%{
#include <stdio.h>
#include <string.h>

int is_keyword(const char *s);
%}

%option noyywrap
%option yylineno

DIGIT      [0-9]
LETTER     [A-Za-z_]
ID         {LETTER}({LETTER}|{DIGIT})*
INT        {DIGIT}+
EXP        ([eE][+-]?{DIGIT}+)
FLOAT      ({DIGIT}+"."{DIGIT}*{EXP}?|{DIGIT}+{EXP})
STRING     \"([^\\\"]|\\.)*\"
CHAR       \'([^\\\']|\\.)\'
WS         [ \t\r]+

%%

"//".* { /* single-line comment */ }
{WS} { /* ignore whitespace */ }
\n  { /* count new lines */ }

{STRING} { printf("Line %d: STRING → %s\n", yylineno, yytext); }
{CHAR} { printf("Line %d: CHAR → %s\n", yylineno, yytext); }
{FLOAT} { printf("Line %d: FLOAT → %s\n", yylineno, yytext); }
{INT} { printf("Line %d: INT → %s\n", yylineno, yytext); }

{ID} {
       if (is_keyword(yytext))
        printf("Line %d: KEYWORD → %s\n", yylineno, yytext);
        else
       printf("Line %d: IDENTIFIER → %s\n", yylineno, yytext);
      }

"=" { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"==" { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"&&" { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"->" { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"+" { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"<" { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"-" { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }

"(" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
")" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
";" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"{"  { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"}" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"::" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }


. { printf("Line %d: ERROR → %s (invalid token)\n", yylineno, yytext); }

%%

int is_keyword(const char *s) {
    static const char *kw[] = {
        "hum","tum","Wapas","Agar","Nahi","LoopKar","Daur",
        "BreakKar","output<-","input->","AgarNahi","Function",
        "ReturnKar","Sahi","Galat"
    };
    for (int i=0;i<15;i++)
        if (strcmp(s, kw[i])==0) return 1;
    return 0;
}

int main(void) {
    yylex();
    return 0;
}

