oracion2(S0,S):-sintagma_nominal2(S0,S1,N),sintagma_verbal2(S1,S,N),!.
oracion2(S0,S):-sintagma_verbal2(S0,S,N),!.
oracion2(S0,S):-sintagma_verbal2(S0,S1,N),conjuncion(S1,S2),oracion2(S2,S),!.
oracion2(S0,S):-negacion(S0,S),!.
oracion2(S0,S):-negacion(S0,S1),oracion2(S1,S),!.
oracion2(S0,S):-afirmacion(S0,S),!.
oracion2(S0,S):-afirmacion(S0,S1),oracion2(S1,S),!.
oracion2(S0,S):-agradecimiento(S0,S),!.
oracion2(S0,S):-agradecimiento(S0,S1),oracion2(S1,S),!.
oracion2(S0,S):-numero(S0,S).

negacion([no|S],S).
negacion([jamás|S],S).
negacion([nunca|S],S).

afirmacion([sí|S],S).
afirmacion([en,efecto|S],S).
afirmacion([claro|S],S).

agradecimiento([gracias|S],S).
agradecimiento([lo,aprecio|S],S).
agradecimiento([lo,agradezco|S],S).

sintagma_nominal2(S0,S,N):-determinante2(S0,S1,N,SX),nombre2(S1,S,N,SX),!.
sintagma_nominal2(S0,S,N):-determinante2(S0,S1,N,SX),nombre2(S1,S2,N,SX),adjetivo(S2,S),!.
sintagma_nominal2(S0,S,N):-pronombreIndet(S0,S1,N,SX),nombre2(S1,S,N,SX),!.
sintagma_nominal2(S0,S,N):-pronombreIndet(S0,S1,N,SX),nombre2(S1,S2,N,SX),adjetivo(S2,S),!.
sintagma_nominal2(S0,S,N):-pronombreIndet(S0,S1,N,SX),numero(S1,S2),nombre2(S2,S,N,SX),!.
sintagma_nominal2(S0,S,N):-numero(S0,S1),tiempo1(S1,S2),tiempo2(S2,S),!.
sintagma_nominal2(S0,S,N):-enfermedad(S0,S),!.
sintagma_nominal2(S0,S,N):-pronombrePersonal(S0,S,N),!.
sintagma_nominal2(S0,S,N):-pronombreReflex(S0,S,N),!.

sintagma_verbal2(S0,S,N):-verbo2(S0,S1,N),sintagma_nominal2(S1,S,N1).
sintagma_verbal2(S0,S,N):-verboIndicativo(S0,S1,N),verboInfinitivo(S1,S2,N),sintagma_nominal2(S2,S,N1).
sintagma_verbal2(S0,S,N):-verbo2(S0,S,N).

conjuncion([pero|S],S).
conjuncion([sin, embargo|S],S).
conjuncion([y|S],S).
conjuncion([o|S],S).
conjuncion([e|S],S).
conjuncion([u|S],S).

pronombrePersonal([yo|S],S,singular).

pronombreReflex([me|S],S,singular).

pronombreIndet([un|S],S,singular,masc).
pronombreIndet([a,un|S],S,singular,masc).
pronombreIndet([unos|S],S,plural,masc).
pronombreIndet([una|S],S,singular,fem).
pronombreIndet([unas|S],S,plural,fem).

determinante2([el|S],S,singular,masc).
determinante2([la|S],S,singular,fem).
determinante2([las|S],S,plural,fem).
determinante2([los|S],S,plural,masc).

enfermedad([dislipidemia|S],S).
enfermedad([hipercolesterolemia|S],S).
enfermedad([desnutricion|S],S).
enfermedad([sobrepeso|S],S).

nombre2([estilo,de,vida|S],S,singular,masc).
nombre2([calorias|S],S,plural,fem).
nombre2([dieta,keto|S],S,singular,fem).
nombre2([dieta,proteica|S],S,singular,fem).
nombre2([dieta,vegetariana|S],S,singular,fem).
nombre2([dieta,alcalina|S],S,singular,fem).
nombre2([mariscos|S],S,plural,masc).
nombre2([vegetales|S],S,plural,masc).
nombre2([peso|S],S,singular,masc).

numero([A|S],S):-number(A).

tiempo1([veces|S],S).
tiempo1([horas|S],S).
tiempo1([minutos|S],S).
tiempo1([segundos|S],S).

tiempo2([al,dia|S],S).
tiempo2([a,la,semana|S],S).
tiempo2([al,mes|S],S).
tiempo2([al,año|S],S).

adjetivo([saludable|S],S).
adjetivo([normal|S],S).

verboIndicativo([deseo|S],S,singular).
verboIndicativo([gustaria|S],S,singular).
verboIndicativo([quiero|S],S,singular).

verboInfinitivo([llevar|S],S,singular).
verboInfinitivo([tener|S],S,singular).
verboInfinitivo([llegar|S],S,singular).

verbo2([han,diagnosticado|S],S,singular).
verbo2([habia,pensado|S],S,singular).
verbo2([corro|S],S,singular).
verbo2([nado|S],S,singular).
verbo2([ejercito|S],S,singular).
verbo2([hago,ejercicio|S],S,singular).
verbo2([cleteo|S],S,singular).
verbo2([gusta|S],S,singular).
verbo2([tengo|S],S,singular).

% para pruebas hacer: oracion2([palabra1,palabra2,palabra2,.....], [lista vacia]).

