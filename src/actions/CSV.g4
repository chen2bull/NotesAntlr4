grammar CSV;

@header {
import java.util.*;
}

/** Derived from rule "file : hdr row+ ;" */
file
locals [int i=0]        // 用locals声明的变量在代码中不会存在同名的变量,ANTLR会将它转成 _localctx.i
     : hdr ( rows+=row[$hdr.text.split(",")] {$i++;} )+
     // 使用中括号来将参数传到row这条规则里面(这些参数的使用看后面的规则)
       {
       System.out.println($i+" rows");
       for (RowContext r : $rows) {
           System.out.println("row token interval: "+r.getSourceInterval());
       }
       }
     ;

hdr : row[String[] columns] {System.out.println("header: '"+$text.trim()+"'");} ;   // hdr是一行字符串而已,就是这么简单

/** Derived from rule "row : field (',' field)* '\r'? '\n' ;" */
// 由于第10行中传入的参数是,hdr行用","分割的字符串数组
row[String[] columns] returns [Map<String,String> values]   // returns定义返回值类型为Map
locals [int col=0]  // 再为规则定义一个本地变量
@init {     // 无论有多少条alternative,init动作发生在任何匹配发生以前
    $values = new HashMap<String,String>();
}
@after {    // after发生在每一条规则被匹配以后
    if ($values!=null && $values.size()>0) {
        System.out.println("values = "+$values);
    }
}
// rule row cont'd...
    :   field
        {
        if ($columns!=null) {
            $values.put($columns[$col++].trim(), $field.text.trim());
        }
        }
        (   ',' field
            {
            if ($columns!=null) {
                $values.put($columns[$col++].trim(), $field.text.trim());
            }
            }
        )* '\r'? '\n'
    ;

field
    :   TEXT
    |   STRING
    |
    ;

TEXT : ~[,\n\r"]+ ;
STRING : '"' ('""'|~'"')* '"' ; // quote-quote is an escaped quote
