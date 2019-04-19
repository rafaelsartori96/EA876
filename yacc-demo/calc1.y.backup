%{
#include <stdio.h>
#include <string.h>

typedef struct variavel_t {
    char nome[256];
    int valor;
    struct variavel_t *proxima;
} variavel_t;

void yyerror(char *c);
int yylex(void);

variavel_t *lista_variaveis = NULL;

%}

/* registro de tokens => declarados em lex */
%token IDENTIFICADOR INT MUL SUM OPEN_PAR CLOSE_PAR EQUALS EOL
/* precedência => soma vem a esquerda, precedência da multiplicação
 * referente a soma */
%left SUM
%left MUL

%%

/*
 * PROGRAMA -> EXPRESSAO \n
 * PROGRAMA -> (vazio)
 */
PROGRAMA:
        PROGRAMA EXPRESSAO EOL { printf("Resultado: %d\n", $2); }
        | PROGRAMA ATRIBUICAO EOL
        |
        ;

/*
 * EXPRESSAO -> INT
 * EXPRESSAO -> OPEN_PAR EXPRESSAO CLOSE_PAR
 * EXPRESSAO -> EXPRESSAO + EXPRESSAO
 * EXPRESSAO -> EXPRESSAO * EXPRESSAO
 */
EXPRESSAO:
    INT
    | IDENTIFICADOR {
        variavel_t *auxiliar = lista_variaveis;
        while (strcmp($1, auxiliar->nome) != 0) {
            auxiliar = auxiliar->proxima;
        }

        if (auxiliar == NULL) {
            printf("Não encontramos valor para identificador!\n");
        } else {
            $$ = auxiliar->valor;
        }
    }

    | OPEN_PAR EXPRESSAO CLOSE_PAR {
        $$ = $2;
        printf("Expressão entre parêntesis: %d\n", $$);
    }

    /*    $1     $2     $3      */
    | EXPRESSAO SUM EXPRESSAO {
        $$ = $1 + $3;
        printf("Encontrei soma: %d + %d = %d\n", $1, $3, $$);
    }

    | EXPRESSAO MUL EXPRESSAO {
        $$ = $1 * $3;
        printf("encontrei multiplicação: %d * %d = %d\n", $1, $3, $$);
    }
    ;

ATRIBUICAO:
    IDENTIFICADOR EQUALS EXPRESSAO {
        variavel_t *variavel = malloc(sizeof(variavel_t));
        strcpy(variavel->nome, $1);
        variavel->valor = $3;
        printf("var %s = %d\n", variavel->nome, variavel->valor);
        variavel->proxima = lista_variaveis;
        lista_variaveis = variavel;
    }
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    variavel_t *aux = lista_variaveis;
    while (aux != NULL) {
        lista_variaveis = aux->proxima;
        free(aux);
        aux = lista_variaveis;
    }
    return 0;
}
