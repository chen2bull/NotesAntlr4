/** Explore Python newline and comment processing */
grammar SimplePy;

@lexer::members {
    int nesting = 0;
}

file:   stat+ EOF ;

stat:   assign NEWLINE
    |   expr NEWLINE
    |   NEWLINE         // ignore blank lines
    ;

assign: ID '=' expr ;

expr:   expr '+' expr
    |   '(' expr ')'
    |   call
    |   list
    |   ID
    |   INT
    ;

call:   ID '(' ( expr (',' expr)* )? ')' ;

list:   '[' expr (',' expr)* ']' ;

ID  :   [a-zA-Z_] [a-zA-Z_0-9]* ;

INT :   [0-9]+ ;

LPAREN    : '(' {nesting++;} ;

RPAREN    : ')' {nesting--;} ;

LBRACK    : '[' {nesting++;} ;

RBRACK    : ']' {nesting--;} ;

/** Nested newline within a (..) or [..] are ignored. */
/** 配合括号规则对nesting的++和--操作*/
IGNORE_NEWLINE
    :   '\r'? '\n' {nesting>0}? -> skip
    ;

/** A logical newline that ends a statement */
/** 只有结束一条语句的换行符会被匹配到这条规则 */
NEWLINE
    :   '\r'? '\n'
    ;

/** Warning: doesn't handle INDENT/DEDENT Python rules */
WS  :   [ \t]+ -> skip
    ;

/** Ignore backslash newline sequences. This disallows comments
 *  after the backslash because newline must occur next.
 *  python的反斜杠后面必须紧跟换行符(不能跟空格加注释),否则就不是
 *
 */
LINE_ESCAPE
    :   '\\' '\r'? '\n' -> skip
    ;

/** Match comments. Don't match \n here; we'll send NEWLINE to the parser. */
COMMENT
    :    '#' ~[\r\n]* -> skip
    ;
