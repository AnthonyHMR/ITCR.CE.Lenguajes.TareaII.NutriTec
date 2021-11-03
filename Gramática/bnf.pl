% Posibles estructuras de una oración aceptada por el BNF
oracion2(S0,S,Clave):-sintagma_nominal2(S0,S1,N,Clave0),sintagma_verbal2(S1,S2,N,Clave1),conjuncion(S2,S3),oracion2(S3,S,Clave),!.
oracion2(S0,S,Clave):-sintagma_nominal2(S0,S1,N,Clave),sintagma_verbal2(S1,S,N,Clave),!.
oracion2(S0,S,Clave):-sintagma_nominal2(S0,S,N,Clave),!.
oracion2(S0,S,Clave):-sintagma_verbal2(S0,S,N,Clave),!.
oracion2(S0,S,Clave):-sintagma_verbal2(S0,S1,N,Clave1),conjuncion(S1,S2),oracion2(S2,S,Clave),!.
oracion2(S0,S,Clave):-negacion(S0,S,Clave),!.
oracion2(S0,S,Clave):-negacion(S0,S1,Clave),oracion2(S1,S,Clave1),!.
oracion2(S0,S,Clave):-afirmacion(S0,S),!.
oracion2(S0,S,Clave):-afirmacion(S0,S1),oracion2(S1,S,Clave),!.
oracion2(S0,S,Clave):-agradecimiento(S0,S),!.
oracion2(S0,S,Clave):-agradecimiento(S0,S1),oracion2(S1,S,Clave),!.
oracion2(S0,S,Clave):-saludo(S0,S,Clave),!.
oracion2(S0,S,Clave):-numero(S0,S,Clave).

head2([H|_], H).

% Saludos
saludo([hola|S],S,[]).
saludo([hola,nutritec|S],S,[]).
saludo([buenas|S],S,[]).
saludo([buenas,nutritec|S],S,[]).
saludo([buenos,dias|S],S,[]).
saludo([buenos,dias,nutritec|S],S,[]).
saludo([buenas,tardes|S],S,[]).
saludo([buenas,tardes,nutritec|S],S,[]).
saludo([buenas,noches|S],S,[]).
saludo([buenas,noches,nutritec|S],S,[]).

% Frases de negación
negacion([no|S],S,no).
negacion([jamas|S],S,no).
negacion([nunca|S],S,no).

% Frases de afirmación
afirmacion([si|S],S).
afirmacion([en,efecto|S],S).
afirmacion([claro|S],S).
afirmacion([por,supuesto|S],S).

% Frases de agradecimiento
agradecimiento([muchas,gracias|S],S).
agradecimiento([muchas,gracias,nutritec|S],S).
agradecimiento([ok,gracias|S],S).
agradecimiento([ok,gracias,nutritec|S],S).
agradecimiento([gracias|S],S).
agradecimiento([gracias,nutritec|S],S).
agradecimiento([lo,aprecio|S],S).
agradecimiento([lo,aprecio,nutritec|S],S).
agradecimiento([lo,agradezco|S],S).
agradecimiento([lo,agradezco,nutritec|S],S).

% Estructuras de sintagma nominal aceptado por BNF
sintagma_nominal2(S0,S,N,Clave):-determinante2(S0,S1,N,SX),nombre2(S1,S,N,SX),!.
sintagma_nominal2(S0,S,N,Clave):-nombre2(S0,S,N,SX),!.
sintagma_nominal2(S0,S,N,Clave):-determinante2(S0,S1,N,SX),nombre2(S1,S2,N,SX),adjetivo(S2,S),!.
sintagma_nominal2(S0,S,N,Clave):-pronombreIndet(S0,S1,N,SX),nombre2(S1,S,N,SX),!.
sintagma_nominal2(S0,S,N,Clave):-pronombreIndet(S0,S1,N,SX),nombre2(S1,S2,N,SX),adjetivo(S2,S),!.
sintagma_nominal2(S0,S,N,Clave):-pronombreIndet(S0,S1,N,SX),numero(S1,S2,Clave),nombre2(S2,S,N,SX),!.
sintagma_nominal2(S0,S,N,Clave):-pronombreIndet(S0,S1,N,SX),numero(S1,S,Clave),!.
sintagma_nominal2(S0,S,N,Clave):-numero(S0,S1,Clave),tiempo1(S1,S2),tiempo2(S2,S),!.
sintagma_nominal2(S0,S,N,Clave):-numero(S0,S1,Clave),nombre2(S1,S,N,SX),!.
sintagma_nominal2(S0,S,N,Clave):-adjetivo(S0,S),!.
sintagma_nominal2(S0,S,N,Clave):-enfermedad(S0,S,Clave),!.
sintagma_nominal2(S0,S,N,Clave):-pronombrePersonal(S0,S,N),!.
sintagma_nominal2(S0,S,N,Clave):-pronombreReflex(S0,S,N),!.


% Estructuras de sintagma verbal aceptado por BNF
sintagma_verbal2(S0,S,N,Clave):-verbo2(S0,S1,N),sintagma_nominal2(S1,S,N1,Clave).
sintagma_verbal2(S0,S,N,Clave):-verboIndicativo(S0,S1,N),sintagma_nominal2(S1,S,N1,Clave).
sintagma_verbal2(S0,S,N,Clave):-verboIndicativo(S0,S1,N),verboInfinitivo(S1,S2,N),sintagma_nominal2(S2,S,N1,Clave).
sintagma_verbal2(S0,S,N,Clave):-verboIndicativo(S0,S1,N),verboInfinitivo(S1,S2,N),adjetivo(S2,S).
sintagma_verbal2(S0,S,N,Clave):-verbo2(S0,S,N).

% Conjunciones
conjuncion([pero|S],S).
conjuncion([sin, embargo|S],S).
conjuncion([y|S],S).
conjuncion([o|S],S).
conjuncion([e|S],S).
conjuncion([u|S],S).
conjuncion([de|S],S).

% Pronombres
pronombrePersonal([yo|S],S,singular).

pronombreReflex([me|S],S,singular).

pronombreIndet([un|S],S,singular,masc).
pronombreIndet([a,un|S],S,singular,masc).
pronombreIndet([unos|S],S,plural,masc).
pronombreIndet([una|S],S,singular,fem).
pronombreIndet([unas|S],S,plural,fem).
pronombreIndet([al|S],S,singular,masc).

% Determinantes
determinante2([el|S],S,singular,masc).
determinante2([la|S],S,singular,fem).
determinante2([las|S],S,plural,fem).
determinante2([los|S],S,plural,masc).

% Enfermedades
enfermedad([dislipidemia|S],S,dislipidemia).
enfermedad([hipercolesterolemia|S],S,hipercolesterolemia).
enfermedad([desnutricion|S],S,desnutricion).
enfermedad([sobrepeso|S],S,sobrepeso).
enfermedad([diabetes|S],S,diabetes).

% Nombres o sustantivos
nombre2([estilo,de,vida|S],S,singular,masc).
nombre2([calorias|S],S,plural,fem).
nombre2([dieta|S],S,singular,fem).
nombre2([dieta,keto|S],S,singular,fem).
nombre2([dieta,proteica|S],S,singular,fem).
nombre2([dieta,vegetariana|S],S,singular,fem).
nombre2([dieta,alcalina|S],S,singular,fem).
nombre2([dieta,detox|S],S,singular,fem).
nombre2([mariscos|S],S,plural,masc).
nombre2([vegetales|S],S,plural,masc).
nombre2([carbohidratos|S],S,plural,masc).
nombre2([carnes|S],S,plural,masc).
nombre2([proteinas|S],S,plural,masc).
nombre2([arroz|S],S,plural,masc).
nombre2([peso|S],S,singular,masc).
nombre2([preferencias|S],S,plural,fem).

% Numero
numero([A|S],S,A):-number(A).

% Frases para frecuencia de eventos
tiempo1([veces|S],S).
tiempo1([horas|S],S).
tiempo1([minutos|S],S).
tiempo1([segundos|S],S).

tiempo2([al,dia|S],S).
tiempo2([a,la,semana|S],S).

% Adejtivos
adjetivo([saludable|S],S).
adjetivo([normal|S],S).
adjetivo([vegana|S],S).
adjetivo([carnivora|S],S).

% Advervios
adverbio([mucho|S],S).
adverbio([bastante|S],S).
adverbio([poco|S],S).

% Verbos
verboIndicativo([deseo|S],S,singular).
verboIndicativo([he,deseado|S],S,singular).
verboIndicativo([desearia|S],S,singular).
verboIndicativo([gustaria|S],S,singular).
verboIndicativo([quiero|S],S,singular).
verboIndicativo([querria|S],S,singular).

verboInfinitivo([llevar|S],S,singular).
verboInfinitivo([tener|S],S,singular).
verboInfinitivo([llegar|S],S,singular).
verboInfinitivo([comer|S],S,singular).
verboInfinitivo([correr|S],S,singular).
verboInfinitivo([trotar|S],S,singular).
verboInfinitivo([tomar|S],S,singular).
verboInfinitivo([gustar|S],S,singular).
verboInfinitivo([querer|S],S,singular).
verboInfinitivo([tener|S],S,singular).
verboInfinitivo([perder|S],S,singular).
verboInfinitivo([empezar|S],S,singular).
verboInfinitivo([realizar|S],S,singular).

verbo2([han,diagnosticado|S],S,singular).
verbo2([habia,pensado|S],S,singular).
verbo2([corro|S],S,singular).
verbo2([nado|S],S,singular).
verbo2([ejercito|S],S,singular).
verbo2([hago,ejercicio|S],S,singular).
verbo2([cleteo|S],S,singular).
verbo2([gusta|S],S,singular).
verbo2([gustan|S],S,plural).
verbo2([tengo|S],S,singular).
verbo2([como|S],S,singular).
verbo2([troto|S],S,singular).
verbo2([tomo|S],S,singular).
verbo2([pienso|S],S,singular).
verbo2([he,pensado|S],S,singular).
verbo2([estoy|S],S,singular).

% para pruebas hacer: oracion2([palabra1,palabra2,palabra2,.....], [lista vacia]).

