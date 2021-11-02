:-include('base de datos.pl').

nivelesactividad(Valor,Y):-
    setnivel(Valor, Y), write(Y).

consultatipodieta(Tipo, Codigodieta):-
   tiposdietas(Codigodieta, Tipo), write(Tipo).

consultapadecimiento(Nombrepade, Codigopade):-
    padecimientos(Codigopade, Nombrepade, _, _), write(Codigopade), nl.

consultadetalledieta(Codigo):-
    dietas(Codigo,_,_,_,_,_,_, Detalle),nombredieta(Codigo, Nombre), write(Nombre),
    nl,
    detalledieta(Detalle, Texto), write(Texto).

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
%Comprueba que una tipo de dieta sea valida para un padecimiento dado
tipoDietaValida(Tipo, Pade):-
    consultapadecimiento(Pade, Codigopade),nl,
    consultatipodieta(Tipo, Codigodieta),
    dietas(_, Codigodieta, _, PadeNoRec,_,_,_,_), not(miembroPadecimiento(Codigopade, PadeNoRec)).



