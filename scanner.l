%{

#include <stdio.h>
#include <string.h>

int is_keyword(const char *s);

FILE *outfile;
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

{WS}       { /* ignore whitespace */ }
\n         { /* count new lines */ }

"chaapdo<-" { printf("Line %d: KEYWORD → %s\n", yylineno, yytext); }
"likhlo->"  { printf("Line %d: KEYWORD → %s\n", yylineno, yytext); }

{STRING}   { printf("Line %d: STRING → %s\n", yylineno, yytext); }
{CHAR}     { printf("Line %d: CHAR → %s\n", yylineno, yytext); }
{FLOAT}    { printf("Line %d: FLOAT → %s\n", yylineno, yytext); }
{INT}      { printf("Line %d: INT → %s\n", yylineno, yytext); }

{ID} {
       if (is_keyword(yytext))
        printf("Line %d: KEYWORD → %s\n", yylineno, yytext);
       else
       printf("Line %d: IDENTIFIER → %s\n", yylineno, yytext);
      }

"rakho"   { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"barabar"   { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"aur"  { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"jama"  { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"manfi"  { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"zarb"  { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"taqseem"  { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }
"kamHai"   { printf("Line %d: OPERATOR → %s\n", yylineno, yytext); }


"(" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
")" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
";" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"{" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"}" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"::" { printf("Line %d: PUNCTUATION → %s\n", yylineno, yytext); }

. { printf("Line %d: ERROR → %s (invalid token)\n", yylineno, yytext); }

%%

int is_keyword(const char *s) {

    static const char *kw[] = {
"Function", "ReturnKar", "LoopKar","BreakKar","Agar","Sahi", "Galat"
,"JabTak","NahiToh","WarnaAgar","Adad","Ashariya","Khali"
    };

    for (int i=0; i < 13; i++) {
        if (strcmp(s, kw[i]) == 0) return 1;
    }

    return 0;
}


int main(void) {
 
    outfile = fopen("tokens.txt", "w");
    if (!outfile) {
        perror("Could not open tokens.txt");
        return 1;
    }

    yylex();

    fclose(outfile);

    return 0;
}
