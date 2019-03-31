%{

#include <stdio.h>

int parentesis_count = 0;

%}

INIT_PARENTESIS   [(]
END_PARENTESIS    [)]

%%


{INIT_PARENTESIS} {
  parentesis_count++;
  //printf("Acumulador = %d\n", parentesis_count);
}
{END_PARENTESIS} {
  parentesis_count--;
  //printf("Acumulador = %d\n", parentesis_count);
}

[.\n]* ;        /* reconhece qualquer caractere e \n, mas não faz nada */


%%

int main() {
  yylex();
  printf( parentesis_count == 0 ? "Programa correto!\n" : "Parêntesis errado!\n");
  return 0;
}
