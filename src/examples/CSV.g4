grammar CSV;

file : hdr row+ ;
hdr : row ;

row : field (',' field)* '\r'? '\n' ;

field
    :   TEXT
    |   STRING
    |                           // 允许为空
    ;

TEXT : ~[,\n\r"]+ ;
STRING : '"' ('""'|~'"')* '"' ; // 这里不能像lexcial_test/StringTest.g4一样使用非贪婪模式
                                // 在CSV文件中, quote-quote is an escaped quote
