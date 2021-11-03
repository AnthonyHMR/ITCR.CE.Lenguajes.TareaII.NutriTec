:-include('listadietas.pl').
tiposdietas(d1, 'keto').
tiposdietas(d2, 'proteica').
tiposdietas(d3, 'vegetariana').
tiposdietas(d4, 'alcalina').
tiposdietas(d5, 'detox').
tiposdietas(d6, 'hipercalorica').

nombredieta(s1,'dieta baja en carbohidratos').
nombredieta(s2, 'dieta alta en proteinas').
nombredieta(s3, 'dieta vegetariana').
nombredieta(s4, 'dieta baja en grasas').
nombredieta(s5, 'dieta sin toxinas').
nombredieta(s6, 'dieta alta en carbohidratos').

padecimientos(p1, dislipemia, 'problemas de control de colesterol', s1).
padecimientos(p2, hipercolesterolemia, 'aumento en los niveles óptimos de colesterol en la sangre',s1).
padecimientos(p3, diabetes,'nivel de azúcar por encima de lo normal', s3).
padecimientos(p4, sobrepeso, 'IMC por encima de lo recomendado', s4).
padecimientos(p5, desnutrición, 'IMC por debajo de lo recomendado', s6).

% dietas(codigo de dieta, codigo nombre dieta, lista padecimientos no
% recomendados, lista padecimientos recomendados, actividades no
% recomendadas, actividades recomendadas).
%prueba: diabetes, 1550 cal, intermedio, proteica

dietas(s1, d1, 1800, [p3,p4, p5], [p1, p2],['no hacer fondo'], ['trotar 15min. 3 días por semana','hacer 15min campotraviesa'], detalle1).
dietas(s2, d2, 1600,[p1, p2, p5, p4], [p3], ['No hacer ejercicios de alto esfuerzo y corta duracion'], ['Practicar natacion', 'Hacer Senderismo'], detalle2).

dietas(s3, d3, 1400,[p1, p2, p5, p4], [p3], ['No hacer ejercicios de alto esfuerzo y corta duracion'], ['Practicar natacion', 'Hacer Senderismo'], detalle3).
dietas(s4, d4,1200, [p5, p3], [p1, p2, p4], [''], ['Ejercicios de cardio'],detalle4).
dietas(s5, d5, 1600, [p5], [p1, p2, p3, p4], ['Evitar fondos', 'Evitar cardio'], ['Actividad fisica de poco esfuerzo'], detalle5).
dietas(s6, d6, 2500,[p1, p2, p3, p4], [p5], [''], ['Practicar deportes de conjunto', 'Natación', 'Campo traviesa', 'Correr'], detalle6).

test:-
    read(X), X='Hola Nutritec', write('Bienvenido, encantado de que verle mejorar su estilo de vida. Cuénteme ¿en qué le puedo ayudar?'),
    split_string(X," ","",Out),nl,
    write(Out).

