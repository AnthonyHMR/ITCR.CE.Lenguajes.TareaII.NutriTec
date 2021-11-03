:-include('base de datos.pl').

nivelesactividad(Valor,Y):-
    setnivel(Valor, Y).
consultanombredieta(Codigodieta, Nombre):-
   nombredieta(Codigodieta, Nombre).

consultatipodieta(Tipo, Codigodieta):-
   tiposdietas(Codigodieta, Tipo).

consultapadecimiento(Nombrepade, Codigopade):-
    padecimientos(Codigopade, Nombrepade, _, _),nl.
consultaRecomend(Padecimiento, Codigodieta):-
    padecimientos(Padecimiento, _, _, Codigodieta).

consultadetalledieta(Codigo):-
   detalledieta(Codigo, Texto), write(Texto).

setnivel(Nivel, 'inicial'):- Nivel = no, !.
setnivel(Nivel, 'inicial'):-Nivel<3,!.
setnivel(Nivel, 'intermedio'):- Nivel<5, !.
setnivel(Nivel, 'avanzado').

% Clausula para conocer si un codigo de padecimiento está en la lista de
% padecimientos, ya sea recomendado o no recomendados.
miembroPadecimiento(Pade, [Pade|_]).
miembroPadecimiento(Pade, [_|Restopade]):-miembroPadecimiento(Pade, Restopade).

% asigna el valor de calorías en la base de datos mas cercano al
% ingresado por el usuario
calorias_a_dieta(Calorias, Mascerca):-
    Rest is (Calorias-1200),
    Rest2 is (Calorias-1400),
    Dif is abs(Rest),
    Odif is abs(Rest2), Dif < Odif, Mascerca is 1200, !.
calorias_a_dieta(Calorias, Mascerca):-
    Rest is (Calorias-1400),
    Rest2 is (Calorias-1600),
    Dif is abs(Rest),
    Odif is abs(Rest2), Dif < Odif, Mascerca is 1400, !.
calorias_a_dieta(Calorias, Mascerca):-
    Rest is (Calorias-1600),
    Rest2 is (Calorias-1800),
    Dif is abs(Rest),
    Odif is abs(Rest2), Dif < Odif, Mascerca is 1600, !.

calorias_a_dieta(Calorias, Mascerca):-
   Rest is (Calorias-1800),
    Rest2 is (Calorias-3000),
    Dif is abs(Rest),
    Odif is abs(Rest2), Dif < Odif, Mascerca is 1800, !.
calorias_a_dieta(Calorias, Mascerca):-
    Rest is (Calorias-1800),
    Rest2 is (Calorias-2500),
    Dif is abs(Rest),
    Odif is abs(Rest2), Dif > Odif,
    Mascerca is 2500.

escribirActividades([]).
escribirActividades([Act|Actividades]):-write(Act), nl, escribirActividades(Actividades).

recomiendaActividad(Nivel, ListaActividades):-
    Nivel='intermedio',
    write('Ademas le recomiendo hacer estas actividades físicas: '), nl,
    escribirActividades(ListaActividades).
recomiendaActividad(Nivel, ListaActividades):-
    Nivel='inicial',
    write('Ademas le recomiendo hacer estas actividades físicas: '), nl,
    escribirActividades(ListaActividades).
recomiendaActividad(Nivel, ListaActividades):-
    Nivel='avanzado',
    write('Ademas de su rutina, podría considerar practicar alguna de estas actividades: '), nl,
    escribirActividades(ListaActividades).
%Comprueba que una tipo de dieta sea valida para un padecimiento dado
%
validarDieta(Padecimiento, Calorias, Actividad, Tipodieta):-
    Padecimiento = no, Calorias = no, Actividad = no, Tipodieta = no,
    dietas(s1, _,_,_,_,_,_, Detalle), write('Para empezar le recomiendo la dieta: '),
    consultanombredieta(s1, Nombre), write(Nombre),nl, consultadetalledieta(Detalle),!.

validarDieta(Padecimiento, Calorias, Actividad, Tipodieta):-
    Calorias = no, Actividad = no, Tipodieta = no,
    consultapadecimiento(Padecimiento, Codigopade),
    consultaRecomend(Codigopade,Codigodieta),
    dietas(Codigodieta,_, _,_,_,_,_,Detalle),
    write('Le recomiendo la dieta: '),
    consultanombredieta(Codigodieta, Nombre),write(Nombre),nl,
    consultadetalledieta(Detalle),!.

validarDieta(Padecimiento, Calorias, Actividad, Tipodieta):-
    Calorias = no, Actividad = no,
    consultapadecimiento(Padecimiento, Codigopade),
    consultatipodieta(Tipodieta, Codigodieta),
    dietas(Codigonombre, Codigodieta, _, PadeNoRec,_,_,_,Detalle), not(miembroPadecimiento(Codigopade, PadeNoRec)),
    write('Le recomiendo la dieta: '),
    consultanombredieta(Codigonombre, Nombre),write(Nombre), nl, consultadetalledieta(Detalle),!.

validarDieta(Padecimiento, Calorias, Actividad, Tipodieta):-
    consultapadecimiento(Padecimiento, Codigopade),
    calorias_a_dieta(Calorias, Mascerca),
    nivelesactividad(Actividad, Nivel),
    consultatipodieta(Tipodieta, Codigodieta),
    dietas(Codigonombre,Codigodieta,Mascerca,PadeNoRec,_,_,Actividades,Detalle), not(miembroPadecimiento(Codigopade, PadeNoRec)),
    write('Para empezar le recomiendo la dieta: '),
    consultanombredieta(Codigonombre, Nombre), write(Nombre),nl, consultadetalledieta(Detalle),
    nl,nl, write('Tambien le recomiendo hacer algunas de estas actividades: '), nl,
    recomiendaActividad(Nivel,Actividades).

