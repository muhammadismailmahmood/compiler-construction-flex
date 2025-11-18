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

{WS}       { }
\n         { }

"dikhao<-" { fprintf(outfile, "Line %d: KEYWORD → %s\n", yylineno, yytext); }
"pakro->" { fprintf(outfile, "Line %d: KEYWORD → %s\n", yylineno, yytext); }

"rakhle" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"sameTOsame" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"jama" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"kaatDo" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"timesKaro" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"baantDo" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"kamHai" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"aur" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }
"yaaPhir" { fprintf(outfile, "Line %d: OPERATOR → %s\n", yylineno, yytext); }

"("  { fprintf(outfile, "Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
")"  { fprintf(outfile, "Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"{"  { fprintf(outfile, "Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"}"  { fprintf(outfile, "Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
";"  { fprintf(outfile, "Line %d: PUNCTUATION → %s\n", yylineno, yytext); }
"::" { fprintf(outfile, "Line %d: PUNCTUATION → %s\n", yylineno, yytext); }

{STRING}     { fprintf(outfile, "Line %d: STRING → %s\n", yylineno, yytext); }
{CHAR}       { fprintf(outfile, "Line %d: CHAR → %s\n", yylineno, yytext); }
{FLOAT}      { fprintf(outfile, "Line %d: FLOAT → %s\n", yylineno, yytext); }
{INT}      { fprintf(outfile, "Line %d: INT → %s\n", yylineno, yytext); }

{ID} {
    if (is_keyword(yytext)) {
        fprintf(outfile, "Line %d: KEYWORD → %s\n", yylineno, yytext);
    } else {
        fprintf(outfile, "Line %d: IDENTIFIER → %s\n", yylineno, yytext);
    }
}

. { fprintf(outfile, "Line %d: ERROR → %s (invalid token)\n", yylineno, yytext); }

%%

int is_keyword(const char *s) {

    static const char *kw[] = {
    "SceneChalau","DenaWapis","MaanLo","WarnaYeh","ParAgar",
    "JitniDairTak","BreakMaro","AgayChalo","BarBar","KlassBanao","SabitRakho",
    "TheekBaat","JhootHai",
    "SadiGinti","PointWali","Harf","Haqeeqat","Alfaz"
    };

    for (int i = 0; i < 18; i++) { 
        if (strcmp(s, kw[i]) == 0) return 1;
    }

    return 0;
}

int main(void) {

    outfile = fopen("tokens.txt", "w");
    if (!outfile) {
        perror("Unable to open tokens.txt");
        return 1;
    }

    yylex();
    fclose(outfile);
    return 0;
}
