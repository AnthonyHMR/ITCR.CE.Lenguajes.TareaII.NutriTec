:-include('../Gram?tica/bnf.pl').
:-include('consulta a base dietas.pl').

play:-
    introduccion,
    preguntas,
    despedida.

introduccion:-
    leer_frase(X),nl,
    saludo(X,[], Clave),
    write('Hola encantado de verlo mejorar su estilo de vida. Cuenteme ?en qu? lo puedo ayudar?'),nl,
    introduccion2,!.

introduccion:-
    write('No te he entendido, ?podr?as volverlo a repetir?'),nl,
    introduccion.

introduccion2:-
    leer_frase(Y),nl,
    oracion2(Y,[], Clave),!.

introduccion2:-
    write('No te he entendido, ?podr?as volverlo a repetir?'),nl,
    introduccion2.


preguntas:-
    write('Excelente iniciativa. Estamos para asesorarte en todo lo que necesites.
?Tienes alguna enfermedad por la que ha iniciado este proceso?, ?cual?'),nl,
    respuesta(Enfermedad),
    write('?Tienes pensado una cantidad espec?fica de calor?as diarias por consumir?'),nl,
    respuesta(Calorias),
    write('?Cuantas veces a la semana hace actividad f?sica?'),nl,
    respuesta(Actividad),
    write('?Tienes un tipo de dieta que te gustar?a realizar?'),nl,
    respuesta(Clave),
    write('?Qu? alimentos preferir?as no consumir?'),nl,
    respuesta(Tipodieta),
    validarDieta(Enfermedad, Calorias, Actividad, Tipodieta),nl,!.

preguntas:-
    write('No hemos podido encontrar ninguna dieta que cumpla con la informaci?n que nos haz brindado'),nl,!.

respuesta(Clave):-
    leer_frase(X),nl,
    oracion2(X,[], Clave),!.

respuesta(Clave):-
    write('No te he entendido, ?podr?as volverlo a repetir?'),nl,
    respuesta(Clave),!.

despedida:-
    leer_frase(X),nl,
    agradecimiento(X,[]),
    write('Fue un gusto poder atenderle. Esperamos y nuestra recomendacion le haya servido de ayuda.'),!.

despedida:-
    write('No te he entendido, ?podr?as volverlo a repetir?'),nl,
    despedida,!.

% Leer_frase es una funci?n la cual es llamada por la funci?n principal
% al momento de querer escribir una oracion en consola y leer la misma
% para separarla en una lista de palabras.
% La funci?n recibe la entrada 'Palabras' la cual es la oraci?n a
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















