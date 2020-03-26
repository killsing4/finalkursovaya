grammar g;

start
   : block '.'
   ;

block
   : consts* vars* procedure* statement
   ;

consts
   : 'const' ident '=' number (',' ident '=' number)*
   ;

vars
   : 'int' ident (',' ident)*
   ;

procedure
   : 'def' ident block
   ;

statement
   : (assignstmt | callstmt | writestmt | qstmt | bangstmt | beginstmt | ifstmt | whilestmt)
   ;

assignstmt
   : ident '=' expression
   ;

callstmt
   : 'call' ident
   ;

writestmt
   : 'write' ident
   ;

qstmt
   : '?' ident
   ;

bangstmt
   : 'print('expression')'
   ;

beginstmt
   : '{' block (block)* '}'
   ;

ifstmt
   : 'if' condition 'then' statement
   ;

whilestmt
   : 'while' condition 'do' statement
   ;

condition
   : 'odd' expression
   | expression ('==' | '#' | '<' | '<=' | '>' | '>=') expression
   ;

expression
   : term ('+' term | '-' term)*
   ;

term
   : a1 = factor('*' a2=factor | '/' a2=factor)*
   ;

factor
   : ident
   | number
   | '(' expression ')'
   ;

ident
   : STRING
   ;

number
   : NUMBER
   ;





STRING
   : [a-zA-Z]+
   ;


NUMBER
   : [0-9]+
   ;

OneComment
: '#' .*? '\n' -> skip
;

ManyComment
: '//' .*? '//' -> skip
;
WS
   : [ \t\r\n] -> skip
   ;