%{
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   #include <stdbool.h>
   // terminal symbols
   #define TOKEN_PLUS  100
   #define TOKEN_MINUS 200
   #define TOKEN_MULTIPLY 300
   #define TOKEN_DIVIDE 400
   #define TOKEN_NUMBER 500
   #define TOKEN_NAME 600
   #define TOKEN_RIGHTPAREN 700
   #define TOKEN_LEFTPAREN 800
   #define TOKEN_EOF 0
%}

%%

[\+|\-]*[0-9]+ {return TOKEN_NUMBER;}
[A-Za-z]+ {return TOKEN_NAME;}
\+	{return TOKEN_PLUS;}
\-      {return TOKEN_MINUS;}
\* 	{return TOKEN_MULTIPLY;}
\\	{return TOKEN_DIVIDE;}
\(	{return TOKEN_LEFTPAREN;}
\)      {return TOKEN_RIGHTPAREN;}

%%


// code regular expression to check the tokesn
// then find a way to tell / return the token TYPE
// check slides (op term, etc.)
// run the lex file with an input file of expressions to test

//lookahead symbol
int  word;

void Fail(void);
bool Factor(void);
bool Eprime(void);
bool Expr(void);
bool Term(void);
bool TPrime(void);

int main(void)
{   
    word = yylex();
    if(Expr())
    {
        if(word == TOKEN_EOF)
	     printf("Valid Arithmetic Expression String\n");
	else
	     Fail();
     }

    return 0;
}


void Fail(void)
{
    printf("Syntax Error--Invalid Input String\n");
    exit(1);
}

bool Eprime(void)
{
    bool success = false;
    if(word == TOKEN_PLUS || word == TOKEN_MINUS)
    {
        word = yylex();
        if(Term())
        {
            return Eprime();
        }
        else
        {
            Fail();
        }  
    }
    else
    {
        if(word == TOKEN_RIGHTPAREN || word == TOKEN_EOF)
            success  = true; /* Expr′→ε */
        else
            Fail();
    }
    return success;
    
}

/* Expr → Term Expr′ */
bool Expr(void)
{
    bool success = false;
    if(Term())
        return Eprime();
    else
        Fail();
    return success;
}

bool Factor(void)
{
    bool success = false;
    
    if(word == TOKEN_LEFTPAREN )
    {    
	word = yylex();
        
        if(!Expr())
            Fail();
        if(word != TOKEN_RIGHTPAREN)
            Fail();
        word = yylex();
        success = true;
    }
    else if(word == TOKEN_NUMBER || word == TOKEN_NAME)
    {   /* Factor→num */
        /* Factor→name */
        word = yylex();
        success = true;
    }
    else
    {
        Fail();
        
    }
    
    return success;
}

/* Term′→ x Factor Term′ */
/* Term′→ ÷ Factor Term′ */
bool TPrime(void)
{
    bool success = false;
    if(word == TOKEN_MULTIPLY || word == TOKEN_DIVIDE)
    {
        word = yylex();
        if(Factor())
        {
            return TPrime();
        }
        else
        {
            Fail();
        }
        
    }
    else if(word == TOKEN_PLUS || word == TOKEN_MINUS || word == TOKEN_RIGHTPAREN || word == TOKEN_EOF)
    {
        /* Term′→ε */
        success = true;
    }
    else
    {
        Fail();
    }
    
    return success;
}

/* Term → Factor Term′ */
bool Term(void)
{
    bool success = false;
    if(Factor())
        return TPrime();
    else
        Fail();
    return success;
}

int yywrap(void)
{ return 1; }


