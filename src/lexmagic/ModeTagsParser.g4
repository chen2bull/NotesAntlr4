parser grammar ModeTagsParser;

options { tokenVocab=ModeTagsLexer; } // 声明使用 tokens from ModeTagsLexer.g4

file: (tag | TEXT)* ;

tag : '<' ID '>'
    | '<' '/' ID '>'
    ;
