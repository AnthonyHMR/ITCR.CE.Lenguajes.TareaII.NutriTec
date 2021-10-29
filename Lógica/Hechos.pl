go:-
    write('Welcome to nutritec'),nl,
    read(X),nl,
    split_string(X," ","",Out),
    write(Out),
    oracion(Out).

%oracion(L):-sintagma_nominal([X|_], [_|Y]).

%sintagma_nominal(X, L):-determinante(X),nombre(Y).

saludo([buenas]).
saludo([hola]).

verbo(comer).
verbo(correr).
verbo(como).
verbo(trotar).
verbo(troto).
verbo(tomar).
verbo(tomo).
verbo(gustar).
verbo(gustaría).
verbo(gusta).
verbo(querer).
verbo(quiero).
verbo(tener).
verbo(tengo).

pronombre([yo]).
nombre([hombre]).

determinante(el).
determinante(la).
determinante(los).
determinante(las).
determinante(a).
determinante(al).




