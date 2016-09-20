grammar VecMsg;

vec4:   '[' ints[4] ']' ;

ints[int max]
locals [int i=1]
    :   INT ( ',' {$i++;} {$i<=$max}?<fail={"exceeded max "+$max}> INT )*
    // fail选项指定这个语义谓词在遇到错误的时候,输出的字符串
    ;

INT :   [0-9]+ ;
WS  :   [ \t\r\n]+ -> skip ;

