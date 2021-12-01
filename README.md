# Arithmetic_Grammar_Parser
Arithmetic Grammar Top-Down Parser

See image for lab instructions (instructions.png)

1. $lex lexer.l

2. $gcc -o lexer lex.yy.c

3. $echo TEST_EXPRESSION | ./lexer

EXAMPLES:
$ echo 1+1 | ./lexer 

Syntax Error--Invalid Input String

$ echo 22 | ./lexer 

Valid Arithmetic Expression String

$ echo "22" | ./lexer 

Valid Arithmetic Expression String

$ echo "9+2" | ./lexer 

Syntax Error--Invalid Input String

$ echo "9 + 2" | ./lexer 
  
Valid Arithmetic Expression String


