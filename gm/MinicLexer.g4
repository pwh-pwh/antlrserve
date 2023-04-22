lexer grammar MinicLexer;

ELSE : 'else';
IF : 'if';
INT : 'int';
FLOAT : 'float';
RETURN : 'return';
VOID : 'void';
DO : 'do';
WHILE : 'while';

ADD : '+';
SUB : '-';
MUL : '*';
DIV : '/';
MOD : '%';

ASSIGN : '=';
GT : '>';
LT : '<';

ARROW : '->';
EQUAL : '==';
LE : '<=';
GE : '>=';
NOTEQUAL : '!=';

SEMI : ';';
COMMA : ',';

LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
LBRACK : '[';
RBRACK : ']';

LINE_COMMENT
    :   '//' ~[\r\n]* -> channel(HIDDEN)
    ;


ID
	:	Letter LetterOrDigit*
	;

fragment
Letter
	:	[a-zA-Z$_] // these are the "java letters" below 0x7F
	|	// covers all characters above 0x7F which are not a surrogate
		~[\u0000-\u007F\uD800-\uDBFF]
		{Character.isJavaIdentifierStart(_input.LA(-1))}?
	|	// covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
		[\uD800-\uDBFF] [\uDC00-\uDFFF]
		{Character.isJavaIdentifierStart(Character.toCodePoint((char)_input.LA(-2), (char)_input.LA(-1)))}?
	;

fragment
LetterOrDigit
	:	[a-zA-Z0-9$_] // these are the "java letters or digits" below 0x7F
	|	// covers all characters above 0x7F which are not a surrogate
		~[\u0000-\u007F\uD800-\uDBFF]
		{Character.isJavaIdentifierPart(_input.LA(-1))}?
	|	// covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
		[\uD800-\uDBFF] [\uDC00-\uDFFF]
		{Character.isJavaIdentifierPart(Character.toCodePoint((char)_input.LA(-2), (char)_input.LA(-1)))}?
	;


//num
NUM
	:	Digit Digit*(.Digit*)?
	;

fragment
Digit
    :   [0-9];


WS  :  [ \t\r\n\u000C]+ -> skip
    ;
