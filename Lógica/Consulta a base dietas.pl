:-include('base de datos.pl').

nivelesactividad(Valor,Y):-
    setnivel(Valor, Y), write(Y).

consultatipodieta(Tipo):-
   tiposdietas(_, Tipo), write(Tipo).

consultapadecimiento(Nombrepade):-
    padecimientos(Codigopade, Nombrepade, _, _), write(Codigopade).

consultadetalledieta(Codigo):-
    dietas(Codigo,_,_,_,_,_,_, Detalle),nombredieta(Codigo, Nombre), write(Nombre),
    nl,
    detalledieta(Detalle, Texto), write(Texto).

setnivel(Nivel, 'inicial'):-Nivel<3,!.
setnivel(Nivel, 'intermedio'):- Nivel<5, !.
setnivel(Nivel, 'avanzado').

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



