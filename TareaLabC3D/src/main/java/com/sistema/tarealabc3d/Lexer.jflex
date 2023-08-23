

package com.sistema.tarealabc3d;


import com.sistema.tarealabc3d.Token;
import java_cup.runtime.*;

%%
/*segunda seccion configuracion*/
%class Lexer
%public
%line
%column
%unicode
%cup

WhiteSpace = [\r|\n|\r\n|\s\t] | [\t\f]

LETRA = [a-zA-Z|ñ]
ENTERO = [0-9]+

PUNTOCOMA = ";"
PARENTESISA ="\("
PARENTESISC ="\)"

MENOS = "-"
MAS = "+"

POR = "*"
DIVISION = "/"
DIGONALB = "_"


IGUAL="="

IDD = (({LETRA}|{DIGONALB})({LETRA}|{ENTERO}|{DIGONALB})*)



/*comodin %{ para agregar codigo java*/
%{
  
    private Symbol symbol(int type, String lexema) {
        return new Symbol(type, new Token(lexema, yyline + 1, yycolumn + 1));
    }
    
	private String cadena ="";

    
%}

/*accion al finlizar el texto*/
%eof{
   System.out.println("LLegue al final desde flex");
%eof}


%%
/* reglas lexicas */

<YYINITIAL> {
    {WhiteSpace} 	{/* ignoramos */}
    {PUNTOCOMA}                 { return symbol(sym.PUNTOCOMA,yytext());}
    {PARENTESISA}               { return symbol(sym.PARENTESISA,yytext());}
    {PARENTESISC}               { return symbol(sym.PARENTESISC,yytext());}
{ENTERO}                    { return symbol(sym.ENTERO,yytext());}
{MENOS}                     { return symbol(sym.MENOS,yytext());}
{MAS}                       { return symbol(sym.MAS,yytext());}
{POR}                       { return symbol(sym.POR,yytext());}
{DIVISION}                  { return symbol(sym.DIVISION,yytext());}
{IDD}                       { return symbol(sym.IDD,yytext());}

{IGUAL}                     { return symbol(sym.IGUAL,yytext());}


}


[^] {System.out.println("error lexico "+ yytext());}