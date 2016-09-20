grammar Enum;
@parser::members {public static boolean java5;}
// 为产生的parser类添加成员叫java5

prog:   (   stat 
        |   enumDecl
        )+
    ;

stat:   id '=' expr ';' {System.out.println($id.text+"="+$expr.text);} ;

expr
    :   id
    |   INT
    ;

enumDecl
    :   {java5}? 'enum' name=id '{' id (',' id)* '}'
        {System.out.println("enum "+$name.text);}
    ;

// 因为*.4规则文件中,'enum'出现过,所以lexer会把enum认为是一个关键字
// 注意在这个例子中,是轮不到ID这种token类型来匹配enum的,可以从生成的Enum.tokens中看到
// ENUM : 'enum' ;      // 'enum'出现过,所以就好像有ENUM这条规则一样
// 所以需要定义一个语法规则id来包含所有可能的标识符
id  :   ID      // 不包含'enum'的!!!
    |   {!java5}? 'enum'
    // 括号中为条件,当不是java5的时候,把enum当做一个id来使用
    ;
    
ID  :   [a-zA-Z]+ ;
INT :   [0-9]+ ;
WS  :   [ \t\r\n]+ -> skip ;
