%{

/*
   As secoes do codigo-fonte sao divididas por %%, da seguinte forma:

   SECAO 1 - DEFINICOES
   %%
   SECAO 2 - REGRAS
   %%
   SECAO 3 - SUBROTINAS

   */

  /* Os delimitadores %{ e %} separam codigo C na secao de definicoes */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

double soma;

/* Criteiros de desempate:
   1 - Maior match
   2 - Regra que vem antes */
%}


LETRA     [a-zA-Z]
DIGITO    [0-9]

PALAVRA   {LETRA}+
INTEIRO   {DIGITO}+
FLOAT     {INTEIRO}+[.]{INTEIRO}+

%%


{INTEIRO} {
  int inteiro = atoi(yytext);
  printf("Inteiro! %d\n", inteiro);
  soma += inteiro;
  printf("Soma = %lf\n", soma);
}
-{INTEIRO} {
  int inteiro = atoi(yytext);
  printf("Inteiro negativo! %d\n", inteiro);
  soma += inteiro;
  printf("Soma = %lf\n", soma);
}

{FLOAT} {
  double ponto_flut = atof(yytext);
  printf("Float %lf\n", ponto_flut);
  soma += ponto_flut;
  printf("Soma = %lf\n", soma);
}
-{FLOAT} {
  double ponto_flut = atof(yytext);
  printf("Float negativo %lf\n", ponto_flut);
  soma += ponto_flut;
  printf("Soma = %lf\n", soma);
}


[a-zA-Z]+ { printf("Encontrei a palavra %s\n", yytext); } /* yytext e o texto que
                                                           deu match na
                                                           expressao regular */

[[:space:]]+ ; /* reconhece qualquer espaço, mas não faz nada */
[[:^space:]]+ ; /* reconhece tudo que não é espaço, mas não faz nada */

[.\n]* ; /* reconhece qualquer caractere e \n, mas não faz nada */


%%

int main() {
  yylex();
  return 0;
}
