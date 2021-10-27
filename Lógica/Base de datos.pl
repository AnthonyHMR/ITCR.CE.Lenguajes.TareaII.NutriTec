:-include('listadietas.pl').
tiposdietas(d1, 'keto').
tiposdietas(d2, 'proteica').
tiposdietas(d3, 'vegetariana').
tiposdietas(d4, 'alcalina').
tiposdietas(d5, 'detox').
nombredieta(s1,'dieta vegana').
nombredieta(s2, 'dieta baja en grasas').
nombredieta(s3, 'dieta baja en carbohidratos').
nombredieta(s4, 'dieta baja en azúcar').

padecimientos(p1, 'dislipemia', 'problemas de control de colesterol', s2).
padecimientos(p2, 'hipercolesterolemia', 'aumento en los niveles óptimos de colesterol en la sangre',s1).
padecimientos(p3, 'diabetes','nivel de azúcar por encima de lo normal', s4).
padecimientos(p4, 'sobrepeso', 'IMC por encima de lo recomendado', s2).
padecimientos(p5, 'desnutrición', 'IMC por debajo de lo recomendado', s3).

setnivel(Nivel, 'inicial'):-Nivel<3,!.
setnivel(Nivel, 'intermedio'):- Nivel<5, !.
setnivel(Nivel, 'avanzado').

nivelesactividad(Valor,Y):-
    setnivel(Valor, Y).

% dietas(codigo de dieta, codigo nombre dieta, lista padecimientos no
% recomendados, lista padecimientos recomendados, actividades no
% recomendadas, actividades recomendadas).
dietas(s3, d1, 1200, [p1, p2, p3, p5], [p4],['no hacer cardio'], ['trotar 3 días por semana','hacer campotraviesa'], detalle1).
dietas(s3, d1, 1300, [p1, p2, p3, p5], [p4],['no hacer cardio'], ['trotar 3 días por semana','hacer campotraviesa'], detalle2).
dietas(s3, d1, 1500, [p1, p2, p3, p5], [p4],['no hacer cardio'], ['trotar 3 días por semana','hacer campotraviesa'], detalle3).

consultatipodieta(Tipo):-
   tiposdietas(_, Tipo).

consultapadecimiento(Pade):-
    padecimientos(_, Pade, _, _).

consultadetalledieta:-
    dietas(_,_,_,_,_,_,_, Detalle),detalledieta(Detalle, Texto), write(Texto).
