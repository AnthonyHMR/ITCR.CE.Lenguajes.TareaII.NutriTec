:-include('../Gramática/bnf.pl').
:-include('consulta a base dietas.pl').

play:-
    introduccion,
    preguntas,
    despedida.

introduccion:-
    leer_frase(X),nl,
    oracion2(X,[], Clave),
    write('Hola encantado de verlo mejorar su estilo de vida. Cuenteme ¿en qué lo puedo ayudar?'),nl,
    leer_frase(Y),nl,
    oracion2(Y,[], Clave).

preguntas:-
    write('Excelente iniciativa. Estamos para asesorarte en todo lo que necesites.
¿Tienes alguna enfermedad por la que ha iniciado este proceso?, ¿cual?'),nl,
    leer_frase(X1),nl,
    oracion2(X1,[], Enfermedad),
    write('¿Tienes pensado una cantidad específica de calorías diarias por consumir?'),nl,
    leer_frase(X2),nl,
    oracion2(X2,[], Calorias),
    write('¿Cuantas veces a la semana hace actividad física?'),nl,
    leer_frase(X3),nl,
    oracion2(X3,[], Actividad),
    write('¿Tienes un tipo de dieta que te gustaría realizar?'),nl,
    leer_frase(X4),nl,
    oracion2(X4,[], Tipodieta),
    write('¿Qué alimentos preferirías no consumir?'),nl,
    leer_frase(X5),nl,
    oracion2(X5,[], Clave),
    validarDieta(Enfermedad, Calorias, Actividad, Tipodieta),nl,!.

preguntas:-
    write('No hemos podido encontrar ninguna dieta que cumpla con la información que nos haz brindado'),nl,!.

despedida:-
    leer_frase(X),nl,
    oracion2(X,[], Clave),
    write('Fue un gusto poder atenderle. Esperamos y nuestra recomendacion le haya servido de ayuda.').

% Leer_frase es una función la cual es llamada por la función principal
% al momento de querer escribir una oracion en consola y leer la misma
% para separarla en una lista de palabras.
% La función recibe la entrada 'Palabras' la cual es la oración a
% convertir en lista.
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















