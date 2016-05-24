grammar Keywords;
@lexer::header {    // 将代码块添加到lexer中,而不是paser类哦!!
import java.util.*;
}

// 明确token类型定义,用来避免implicit def warnings
tokens { BEGIN, END, IF, THEN, WHILE }

@lexer::members {
// 添加成员的方法和paser类似
// 注意这里只是创建一个Map表,然后把一些自定义的token类型放在表里面,line31才是设置Token类型的地方
Map<String,Integer> keywords = new HashMap<String,Integer>() {{
    put("begin", KeywordsParser.BEGIN);
    put("end",   KeywordsParser.END);
    put("if",    KeywordsParser.IF);
    put("then",  KeywordsParser.THEN);
    put("while", KeywordsParser.WHILE);
}};
}

// 这里看到,lexer中的token类型是否可变不影响 parser中的规则
stat:   BEGIN stat* END
    |   IF expr THEN stat
    |   WHILE expr stat
    |   ID '=' expr ';'
    ;

expr:   INT | CHAR ;

ID  :   [a-zA-Z]+
        {
        // getText()是Lexer中的方法,所以可以出现在lexer规则的代码中
        if ( keywords.containsKey(getText()) ) {
            setType(keywords.get(getText())); // 重新设置token类型
        }
        }
    ;

/** Convert 3-char 'x' input sequence to string x */
CHAR:   '\'' . '\'' {setText( String.valueOf(getText().charAt(1)) );} ;

INT :   [0-9]+ ;

WS  :   [ \t\n\r]+ -> skip ;
