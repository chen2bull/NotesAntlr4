grammar Data;


/*
$  antlr4  -no-listener  Data.g4
$  javac  Data*.java
$  grun  Data  file  -tree  t.data
*/
file : group+ ;

group: INT sequence[$INT.int] ;     // 直接获取前面INT匹配的数值

sequence[int n]
locals [int i = 1;]
        // match n integers
        // 语义谓词的作用,当条件成立的时候,规则有效,否则不生效
     : ( {$i<=$n}? INT {$i++;} )*   // Boolean-valued  action，当前一个条件成立时
                                    // 注意看星号，表示看*号匹配一条或多条这种规则
     ;
     
INT :   [0-9]+ ;             // match integers
WS  :   [ \t\n\r]+ -> skip ; // toss out all whitespace
