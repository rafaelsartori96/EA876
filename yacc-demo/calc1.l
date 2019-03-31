
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}


%%

[0-9]+  { /* Definimos o que é o token INT */
    yylval = atoi(yytext);
    return INT;
}

[A-Za-z][A-Za-z0-9]* { /* Definimos o que é o token IDENTIFICADOR,
                        * deve começar com letra */
    yylval = yytext;
    return IDENTIFICADOR;
}

[=]     { /* Definimos o que é o token EQUALS */
    return EQUALS;
}

[+]     { /* Definimos o que é o token SUM */
    return SUM;
}

[*]     { /* Definimos o que é o token MUL */
    return MUL;
}

[(]     { /* Definimos o que é o token OPEN_PAR */
    return OPEN_PAR;
}

[)]     { /* Definimos o que é o token CLOSE_PAR */
    return CLOSE_PAR;
}

\n      { /* Definimos o que é o token EOL */
    return EOL;
}

[ \t]+ ;

.       {
    yyerror("Token nao reconhecido!\n");
}

%%

int yywrap() {
  return 1;
}
