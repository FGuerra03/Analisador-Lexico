package br.com.felipe.guerra;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class LexicalAnalyzer
%type void


ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*
OPSOMA = "+"
OPSUB = "-"
OPMUL = "*"
OPDIV = "/"
OPATB = "="
AP = "("
FP = ")"
MAIOR = ">"
MENOR = "<"
MAIORIGL = ">="
MENORIGL = "<="
IGUAL = "=="
DIFERENTE = "!="
PONTOVIRG = ";"
PONTO = "."
DOISPNT = ":"
VIRGULA = ","
NATURAL = 0|[1-9][0-9]*
REAL = [-+]?[0-9]*\,?[0-9]+
EXPONENCIAL = -[0-9]+,[0-9]|[0-9]+,[0-9]+ "e" -[0-9]+,[0-9]|[0-9]+,[0-9]+ 
STRING = '.[^']*'
COMENT1 = \/\*[\s\S]*?\*\/
COMENT2 = \/\/.*
BRANCO = [\n| |\t|\r]


%%
"program"				 { imprimir("Palavra reservada program", yytext()); }
"begin"					 { imprimir("Palavra reservada begin", yytext()); }
"end"					 { imprimir("Palavra reservada end", yytext()); }
"write"					 { imprimir("Palavra reservada write", yytext()); }
"read"					 { imprimir("Palavra reservada read", yytext()); }
"if"                     { imprimir("Palavra reservada if", yytext()); }
"then"					 { imprimir("Palavra reservada then", yytext()); }
"else"				  	 { imprimir("Palavra reservada else", yytext()); }
"var"					 { imprimir("Palavra reservada var", yytext()); }
"integer"				 { imprimir("Palavra reservada integer", yytext()); }
"real"		   			 { imprimir("Palavra reservada real", yytext()); }
{ID}                     { imprimir("Identificador", yytext()); }
{OPSOMA}                 { imprimir("Operador de soma", yytext()); }
{OPSUB}                  { imprimir("Operador de subtração", yytext()); }
{OPMUL}                  { imprimir("Operador de multiplicação", yytext()); }
{OPDIV}                  { imprimir("Operador de divisão", yytext()); }
{OPATB}                  { imprimir("Operador de atribuição", yytext()); }
{EXPONENCIAL}				 {imprimir("Número Exponencial" , yytext()); }
{AP}                     { imprimir("Abre parênteses", yytext()); }
{FP}                     { imprimir("Fecha parênteses", yytext()); }
{MAIOR}                     { imprimir("Operador de comparação >", yytext()); }
{MENOR}                     { imprimir("Operador de comparação <", yytext()); }
{MENORIGL}                     { imprimir("Operador de comparação <=", yytext()); }
{MAIORIGL}                     { imprimir("Operador de comparação >=", yytext()); }
{IGUAL}                     { imprimir("Operador de comparação ==", yytext()); }
{DIFERENTE}                     { imprimir("Operador de comparação !=", yytext()); }
{PONTOVIRG}                     { imprimir("Ponto e vírgula", yytext()); }
{PONTO}                     { imprimir("Ponto", yytext()); }
{DOISPNT}                     { imprimir("Dois pontos", yytext()); }
{VIRGULA}                     { imprimir("Vírgula", yytext()); }
{NATURAL}                { imprimir("Número Natural", yytext()); }
{REAL}					 {imprimir("Número Real" , yytext()); }
{EXPONENCIAL}				 {imprimir("Número Exponencial" , yytext()); }	
{STRING}				 {imprimir("String" , yytext()); }
{COMENT1}				 {imprimir("Comentário de multiplas linhas" , yytext()); }	
{COMENT2}				 {imprimir("Comentário de linha única" , yytext()); }	
{BRANCO}                     { imprimir("Espaço em branco", yytext()); }
. { throw new RuntimeException("Caractere inválido " + yytext()); }