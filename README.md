# Arithmetic_Grammar_Parser
Arithmetic Grammar Top-Down Parser

See image for lab instructions (instructions.png)

1. $lex lexer.l

2. $gcc -o lexer lex.yy.c

3. $echo TEST_EXPRESSION | ./lexer

EXAMPLES:
samiracoliva@ubuntu:~/Documents/sjsu/CMPE152/LabExercises/LabExercise6$ echo 1+1 | ./lexer 
Syntax Error--Invalid Input String
samiracoliva@ubuntu:~/Documents/sjsu/CMPE152/LabExercises/LabExercise6$ echo 22 | ./lexer 

Valid Arithmetic Expression String
samiracoliva@ubuntu:~/Documents/sjsu/CMPE152/LabExercises/LabExercise6$ echo "22" | ./lexer 

Valid Arithmetic Expression String
samiracoliva@ubuntu:~/Documents/sjsu/CMPE152/LabExercises/LabExercise6$ echo "9+2" | ./lexer 
Syntax Error--Invalid Input String
samiracoliva@ubuntu:~/Documents/sjsu/CMPE152/LabExercises/LabExercise6$ echo "9 + 2" | ./lexer 
  
Valid Arithmetic Expression String
samiracoliva@ubuntu:~/Documents/sjsu/CMPE152/LabExercises/LabExercise6$ 

