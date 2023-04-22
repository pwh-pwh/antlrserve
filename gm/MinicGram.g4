grammar MinicGram;
import MinicLexer;

program
    :   definition_list
    ;

definition_list
    :   definition_list definition
    |   definition
    ;

definition
    :   variable_definition
    |   function_definition
    ;

variable_definition
    :   type_indicator ID ';'
    |   type_indicator ID '[' NUM ']' ';'
    ;

type_indicator
    :   INT | FLOAT | VOID;

function_definition
    :   type_indicator ID '(' parameters ')' compound_stmt;

parameters
    :   parameter_list
    |   VOID;

parameter_list
    :   parameter_list ',' parameter
    |   parameter
    ;

parameter
    :   type_indicator ID
    |   type_indicator ID '[' ']'
    ;

compound_stmt
    :   '{' local_definitions statememt_list '}';

local_definitions
    :   local_definitions variable_definition
    | empty
    ;

statememt_list
    :   statememt_list statememt
    |   empty
    ;

statememt
    :   expression_stmt
    |   compound_stmt
    |   condition_stmt
    |   dowhile_stmt
    |   return_stmt
    ;

expression_stmt
    :   expression ';'
    |   ';';

condition_stmt
    :   IF '(' expression ')' statememt
    |   IF '(' expression ')' statememt ELSE statememt
    ;

dowhile_stmt
    :   DO statememt WHILE '(' expression ')' ';';

return_stmt
    :   RETURN ';'
    |   RETURN expression ';'
    ;

expression
    :   variable '=' expression
    |   simple_expression
    ;

variable
    :   ID
    |   ID '[' expression ']'
    ;

simple_expression
    :   additive_expression relop additive_expression
    |   additive_expression
    ;

relop
    : '<='
    | '<'
    | '>'
    | '>='
    | '=='
    | '!='
    ;

additive_expression
    :   additive_expression addop term
    | term
    ;

addop
    :   '+'
    |   '-'
    ;

term
    :   term mulop factor
    |   factor
    ;

mulop
    : '*'
    | '/'
    | '%'
    ;

factor
    :   '(' expression ')'
    |   variable
    |   call
    |   NUM
    ;

call
    :   ID '(' arguments ')';

arguments
    :   argument_list
    |   empty
    ;

argument_list
    :   argument_list ',' expression
    |   expression
    ;


empty
    :;