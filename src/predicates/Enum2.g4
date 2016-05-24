grammar Enum2;
@lexer::members {public static boolean java5 = false;}

prog:   (   stat 
        |   enumDecl
        )+
    ;

stat:   ID '=' expr ';' {System.out.println($ID.text+"="+$expr.text);} ;

expr:   ID
    |   INT
    ;

// No predicate needed here because 'enum' token undefined if !java5  !!!!!!!!!!!
enumDecl
    :   'enum' name=ID '{' ID (',' ID)* '}'
        {System.out.println("enum "+$name.text);}
    ;

ENUM:   'enum' {java5}? ;  // 语法要点:1.这条词法规则必须在ID之前; 2.语义谓词必须写在规则末尾
// 使用不同语法的原因是:
// 语法规则中的语义谓词放在规则的开头,是因为parser需要预测后面的是什么
// 词法规则中的语义谓词放在规则的末尾,是因为lexer需要匹配最长的输入
ID  :   [a-zA-Z]+ ;


INT :   [0-9]+ ;
WS  :   [ \t\r\n]+ -> skip ;
