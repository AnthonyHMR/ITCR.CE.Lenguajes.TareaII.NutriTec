:-include('../Gram�tica/bnf.pl').

play:-
    introduccion,
    preguntas,
    recomendacion.

introduccion:-
    leer_frase(X),nl,
    oracion2(X,[]),
    write('Hola encantado de verlo mejorar su estilo de vida. Cuenteme �en qu� lo puedo ayudar?'),nl,
    leer_frase(Y),nl,
    oracion2(Y,[]).

preguntas:-
    write('Excelente iniciativa. Estamos para asesorarte en todo lo que necesites.
�Tienes alguna enfermedad por la que ha iniciado este proceso?, �cual?'),nl,
    leer_frase(X1),nl,
    oracion2(X1,[]),
    write('�Tienes pensado una cantidad espec�fica de calor�as diarias por consumir?'),nl,
    leer_frase(X2),nl,
    oracion2(X2,[]),
    write('�Cuantas veces a la semana hace actividad f�sica?'),nl,
    leer_frase(X3),nl,
    oracion2(X3,[]),
    write('�Tienes un tipo de dieta que te gustar�a realizar?'),nl,
    leer_frase(X4),nl,
    oracion2(X4,[]),
    write('�Qu� alimentos preferir�as no consumir?'),nl,
    leer_frase(X5),nl,
    oracion2(X5,[]).

recomendacion:-
    write('Puedes empezar con el siguiente plan alimenticio bajo en grasas.'),nl,
    leer_frase(X),nl,
    oracion2(X,[]).


leer_frase(Palabras):-
    get0(Caracter),
    leer_resto(Caracter,Palabras).

leer_resto(46,[]):-!.
leer_resto(10,Palabras):-!,
    leer_frase(Palabras).
leer_resto(32,Palabras):-!,
    leer_frase(Palabras).
leer_resto(Caracter,[Palabra|Palabras]):-
    leer_caracteres(Caracter,Caracteres,Siguiente_caracter),
    name(Palabra,Caracteres),
    leer_resto(Siguiente_caracter,Palabras).

leer_caracteres(46,[],46):-!.
leer_caracteres(32,[],32):-!.
leer_caracteres(Caracter,[Caracter|Caracteres],Siguiente_caracter):-
    get0(Nuevo_Caracter),
    leer_caracteres(Nuevo_Caracter,Caracteres,Siguiente_caracter).















