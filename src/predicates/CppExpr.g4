grammar CppExpr;

/** Distinguish between alts 1, 2 using idealized predicates as demo */
// 这只是个演示的例子,如果要使用的话,需要自定义这两个方法
expr:   {isfunc(ID)}? ID '(' expr ')' // func call with 1 arg
    |   {istype(ID)}? ID '(' expr ')' // ctor-style type cast of expr
    |   INT                       // integer literal
    |   ID                        // identifier
    ;

ID  :   [a-zA-Z]+ ;
INT :   [0-9]+ ;
WS  :   [ \t\n\r]+ -> skip ;