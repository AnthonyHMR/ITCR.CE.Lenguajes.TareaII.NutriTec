:-include('base de datos.pl').
% Este archivo contiene reglas y consultas basadas en la informacion
% disponible en la base de datos.

%setnivel(Valor, Resultado): Valor: entero mayor que 0
% este predicado verifica los rangos de actividad fisica que realiza un
% paciente y el resultado es una palabra clave: inicial, intermedio,
% avanzado
setnivel(Nivel, 'inicial'):- Nivel = no, !.
setnivel(Nivel, 'inicial'):-Nivel<3,!.
setnivel(Nivel, 'intermedio'):- Nivel<5, !.
setnivel(Nivel, 'avanzado').

%nivelesactividad(Valor, Y): Valor: entero mayor que 0.
% predicado que hace la llamada a setnivel para conocer la palabra clave
% definida para su nivel (Y).
nivelesactividad(Valor,Y):-
    setnivel(Valor, Y).

%consultanombredieta(Codigodieta, Nombre):
%predicado para obtener el nombre de una dieta en la base de datos.
% Codigodieta: es un parametro asociado a la tabla de nombres de dietas
% en la base de datos, sus valores pueden ser s1, s2,..., s6.
% Nombre: resultado de la busqueda que hace match con el codigo
consultanombredieta(Codigodieta, Nombre):-
   nombredieta(Codigodieta, Nombre).

%consultatipodieta(Tipo, Codigo):
%predicado para obtener el codigo de un tipo dieta en la base de datos.
% Tipo: es un parametro asociado a la tabla de tipos de dietas
% en la base de datos, sus valores pueden ser d1, d2,..., d6.
% Nombre: resultado de la busqueda que hace match con el codigo del tipo

consultatipodieta(Tipo, Codigodieta):-
   tiposdietas(Codigodieta, Tipo).

%consultapadecimiento(Nombre, Codigo):
% predicado para obtener el codigo de un padecimiento en la base de
% datos.
% Codigo: es un parametro asociado a la tabla de tipos de dietas en
% la base de datos, sus valores pueden ser p1, p2,..., p5.
% Nombre: valor que pertenece al nombre de la enfermedad en la base de
% datos que coincide con el codigo.
%
consultapadecimiento(Nombrepade, Codigopade):-
    padecimientos(Codigopade, Nombrepade, _, _),nl.

%consultaRecomend(Padecimiento, Codigodieta):
%predicado que busca la dieta recomendada para un padecimiento dado.
%Padecimiento: codigo del padecimiento en la base de datos.
%Codigodieta: codigo del nombre de la dieta en la base de datos.
%
consultaRecomend(Padecimiento, Codigodieta):-
    padecimientos(Padecimiento, _, _, Codigodieta).

%consultadetalledieta(Codigo):
% predicado que escribe el detalle de una dieta para recomendar al
% cliente.
% Codigo: codigo de la recomendacion en la base de datos.

consultadetalledieta(Codigo):-
   detalledieta(Codigo, Texto), write(Texto).

%miembroPadecimiento(Padecimiento, Lista):
% Predicado para conocer si un codigo de padecimiento está en la lista
% de padecimientos, ya sea recomendado o no recomendados.
% Padecimiento: codigo de un padecimiento de la base de datos.
% Lista: Lista de codigos de padecimientos.
miembroPadecimiento(Pade, [Pade|_]).
miembroPadecimiento(Pade, [_|Restopade]):-miembroPadecimiento(Pade, Restopade).

%calorias_a_dieta(Calorias, Mascerca):
% predicado que asigna el valor de calorías en la base de datos mas
% cercano al ingresado por el usuario.
% Calorias: numero entero entre 1000 y 3000.
% Mascerca: numero entero resultado asociado a las calorias que tienen
% las dietas de la base de datos.
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

%escribirActividades(Lista):
%predicado que recorre la lista y escribe los elementos de la misma.
%Lista: lista de actividades o padecimientos.
escribirActividades([]).
escribirActividades([Act|Actividades]):-write(Act), nl, escribirActividades(Actividades).

%recomiendaActividad(Nivel, Lista):
% predicado que recomienda una lista de actividades de acuerdo con el
% nivel de actividad fisica que tenga el cliente.
% Nivel: string con el nivel asociado al cliente
% Lista: lista de actividades recomendadas o no recomendadas.
%
recomiendaActividad(Nivel, ListaActividades):-
    Nivel='intermedio',
    escribirActividades(ListaActividades).
recomiendaActividad(Nivel, ListaActividades):-
    Nivel='inicial',
    escribirActividades(ListaActividades).
recomiendaActividad(Nivel, ListaActividades):-
    Nivel='avanzado',
    escribirActividades(ListaActividades).


% validarDieta(Padecimiento, Calorias, Actividad, Tipodieta):
% predicado que comprueba que los parametros de salud del cliente
% coincidan con la base de datos y le recomiende una dieta.
% Padecimiento: enfermedad indicada por el usuario
% Calorias: Numero entero entre 1000 y 3000.
% Actividad: Numero entero mayor que 0.
% Tipodieta: dieta preferida por el usuario.
%
validarDieta(Padecimiento, Calorias, Actividad, Tipodieta):-
    Padecimiento = no, Calorias = no, Actividad = no, Tipodieta = no,
    dietas(s1, _,_,_,_,_,_, Detalle), write('Para empezar le recomiendo la dieta: '),
    consultanombredieta(s1, Nombre), write(Nombre),nl, consultadetalledieta(Detalle), nl,!.

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

