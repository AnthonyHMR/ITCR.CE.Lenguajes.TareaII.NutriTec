saludo([buenas]).
saludo([buenos, dias]).
saludo([buenas,tardes]).
saludo([buenas,noches]).
saludo([hola]).

verbo(deseado).
verbo(pensado).

playNutriTec:-
    read(X),nl,
    write('Hola encantado de verlo mejorar su estilo de vida. Cuenteme ¿en qué lo puedo ayudar?'),nl,
    write('Excelente iniciativa. Estamos para asesorarte en todo lo que necesites.
¿Tienes alguna enfermedad por la que ha iniciado este proceso?, ¿cual?'),nl,
    write('¿Tienes pensado una cantidad específica de calorías diarias por consumir?'),nl,
    write('¿Cuantas veces a la semana hace actividad física?'),nl,
    write('¿Tienes un tipo de dieta que te gustaría realizar?'),nl,
    write('¿Qué alimentos preferirías no consumir?'),nl,
    write('Puedes empezar con el siguiente plan alimenticio bajo en grasas.'),nl,
    read(Y),nl,
    split_string(Y," ","",Out),nl,
    write('.'),nl,
    write(Out),
    verbo(Out).









