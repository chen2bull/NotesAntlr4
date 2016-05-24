grammar Vec;

vec4:   '[' ints[4] ']' ;
ints[int max]
locals [int i=1]
    :   INT ( ',' {$i++;} {$i<=$max}? INT )*    // 出错的时候只打印字符串"{$i<=$max}"
    ;

INT :   [0-9]+ ;
WS  :   [ \t\r\n]+ -> skip ;
