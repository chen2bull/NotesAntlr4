parser grammar XMLParser;
options { tokenVocab=XMLLexer; }

// 词法问题已经解决了XML文件中的sea和island语言的问题
// 语法规则仍然是十分自然的
document    :   prolog? misc* element misc*;

prolog      :   XMLDeclOpen attribute* SPECIAL_CLOSE ;
// xml声明<?xml只能以?>结束
// XMLDeclOpen后面,不是只匹配version,encoding和standalone,而是可以匹配一个属性列表

content     :   chardata?
                ((element | reference | CDATA | PI | COMMENT) chardata?)* ;

element     :   '<' Name attribute* '>' content '<' '/' Name '>'
            |   '<' Name attribute* '/>'
            ;

reference   :   EntityRef | CharRef ;

attribute   :   Name '=' STRING ; // Our STRING is AttValue in spec
/** ``All text that is not markup constitutes the character data of
 *  the document.''
 */
chardata    :   TEXT | SEA_WS ;
// 使用空字符和TEXT作为chardata(而不是直接使用TEXT)
// 因为在sea中,某些元素支持空字符(比如<root>)

misc        :   COMMENT | PI | SEA_WS ;
