#!/bin/sh

#echo '开始生成antlr文件'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.12.0-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.12.0-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
antlr4 gm/MinicGram.g4
javac gm/MinicGram*.java
