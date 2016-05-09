grammar StringTest;
start : STRING+;

STRING: '"'(ESC|.)*?'"';    // 这里ESC必须在点号之前,这样才能正常匹配"what\"else"
                            // 如果点号在ESC前面的话匹配到"what\"就会结束了

SPACE: (' ' | '\t' |'\r'?'\n') -> skip;

fragment ESC: '\\"' | '\\\\';   // 这种写法,比下面一种更简单
//fragment  ESC  :  '\\' [btnr"\\]  ;  //  \b,  \t,  \n  etc,注意这里不是匹配真正的\t而是字面上的"\t"等

