# Mini C++-Like Lexical Analyzer

## Overview
This project is a lexical analyzer built using Flex for a Mini C++-like language. It tokenizes source code by recognizing keywords, identifiers, literals, operators, and punctuation.

## Files
- `scanner.l`: Lexer definitions using Flex
- `test.mc`: Sample program source code
- `tokens.txt`: Output tokens with lexical analysis results

## Usage
1. Generate lexer: `flex scanner.l`
2. Compile: `gcc lex.yy.c -lfl -o lexer`
3. Run lexer: `./lexer < test.mc > tokens.txt`

## Notes
- Handles core tokens and reports invalid tokens as errors.
- Designed for learning lexical analysis concepts and compiler foundations.


