#!/bin/sh

#echo '开始生成antlr文件'
antlr4 gm/MinicGram.g4
javac gm/MinicGram*.java
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.12.0-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.12.0-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
cd gm
grun MinicGram program -ps ../img/out.ps ../example/input.txt