saludo([buenas]).
saludo([buenos, dias]).
saludo([buenas,tardes]).
saludo([buenas,noches]).
saludo([hola]).

verbo(deseado).
verbo(pensado).

playNutriTec:-
    read(X),nl,
    write('Hola encantado de verlo mejorar su estilo de vida. Cuenteme �en qu� lo puedo ayudar?'),nl,
    write('Excelente iniciativa. Estamos para asesorarte en todo lo que necesites.
�Tienes alguna enfermedad por la que ha iniciado este proceso?, �cual?'),nl,
    write('�Tienes pensado una cantidad espec�fica de calor�as diarias por consumir?'),nl,
    write('�Cuantas veces a la semana hace actividad f�sica?'),nl,
    write('�Tienes un tipo de dieta que te gustar�a realizar?'),nl,
    write('�Qu� alimentos preferir�as no consumir?'),nl,
    write('Puedes empezar con el siguiente plan alimenticio bajo en grasas.'),nl,
    read(Y),nl,
    split_string(Y," ","",Out),nl,
    write('.'),nl,
    write(Out),
    verbo(Out).









