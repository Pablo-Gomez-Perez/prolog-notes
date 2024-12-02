% Ingredientes
ingrediente(lechuga).
ingrediente(tomate).
ingrediente(espinaca).
ingrediente(zanahoria).
ingrediente(cebolla).
ingrediente(lentejas).
ingrediente(ajo).
ingrediente(arroz).
ingrediente(tortilla).
ingrediente(pasta).
ingrediente(huevo).
ingrediente(queso).
ingrediente(crema).
ingrediente(aceite_oliva).
ingrediente(salmon).
ingrediente(pollo).
ingrediente(pechuga).
ingrediente(tocino).
ingrediente(carne_res).
ingrediente(aguacate).
ingrediente(limon).
ingrediente(pimienta).
ingrediente(salsa_soya).
ingrediente(eneldo).
ingrediente(pan).

% Vegetales
vegetal(lechuga).
vegetal(tomate).
vegetal(espinaca).
vegetal(zanahoria).
vegetal(cebolla).
vegetal(lentejas).
vegetal(aguacate).

% Animales
animal(pechuga).
animal(salmon).
animal(pollo).
animal(carne_res).
animal(tocino).
animal(huevo).

% Otros (condimentos, lácteos, carbohidratos, etc.)
condimento(ajo).
condimento(limon).
condimento(pimienta).
condimento(eneldo).

carbohidrato(arroz).
carbohidrato(tortilla).
carbohidrato(pasta).
carbohidrato(pan).

lacteo(queso).
lacteo(crema).

grasa(aceite_oliva).
grasa(salsa_soya).

% Recetas y sus ingredientes
receta(ensalada_verde, [lechuga, espinaca, tomate, zanahoria, aceite_oliva]).
receta(pollo_asado, [pechuga, ajo, limon, pimienta, aceite_oliva]).
receta(sopa_lentejas, [lentejas, zanahoria, cebolla, ajo]).
receta(pasta_carbonara, [pasta, huevo, queso, tocino, crema]).
receta(tacos_res, [tortilla, carne_res, cebolla, limon]).
receta(hamburguesa, [pan, carne_res, lechuga, tomate, queso]).
receta(omelette, [huevo, queso, cebolla, zanahoria]).
receta(salmon_horno, [salmon, ajo, limon, eneldo, pimienta]).
receta(arroz_frito, [arroz, huevo, zanahoria, cebolla, salsa_soya]).
receta(guacamole, [aguacate, limon, cebolla, tomate]).

% Valores nutricionales: receta(Calorías, Carbohidratos, Proteínas, Grasas)
valor_nutricional(ensalada_verde, [120, 10, 3, 8]).
valor_nutricional(pollo_asado, [250, 0, 40, 10]).
valor_nutricional(sopa_lentejas, [180, 30, 12, 4]).
valor_nutricional(pasta_carbonara, [400, 50, 12, 18]).
valor_nutricional(tacos_res, [300, 20, 18, 12]).
valor_nutricional(hamburguesa, [450, 35, 25, 20]).
valor_nutricional(omelette, [200, 2, 15, 14]).
valor_nutricional(salmon_horno, [320, 0, 25, 18]).
valor_nutricional(arroz_frito, [350, 45, 10, 12]).
valor_nutricional(guacamole, [150, 8, 2, 13]).

%Reglas.

% con esta consulta determianmos si un ingrediente es parte de una receta
% o qué recetas cuentan con este ingrediente.
ingrediente_de(X,Y) :- 
    receta(Y,Z),
    member(X,Z).

% Verificar si una de las recetas es vegetariana
% si uno solo de los ingredientes en la lista es animal o lacteo entonces
% la receta no es vegetariana
es_vegetariana(X) :-
    receta(X,Y),
    \+ (member(Z,Y),
        (animal(Z) ; lacteo(Z))).

% Identificar si una receta es adecuada para deportistas en base a su
% valor nutricional.
receta_deportiva(X) :- valor_nutricional(X, [CALS, CARBS, PROTS, GRAS]),
    CALS >= 200, CALS =< 400,
    CARBS < 40,
    PROTS >= 20,
    GRAS =< 15.

% Para identificar si una receta es balanceada esta debe contener al menos
% un ingrediente de origen animal, un vegetal y un carbohidrato.
receta_balanceada(X) :-
    receta(X,Y),
    once((member(A,Y), vegetal(A))),
    once((member(B,Y), animal(B))),
    once((member(C,Y), carbohidrato(C))).

% Para determinar si una regla comparte ingredientes con otra receta
% y a su vez identificar cuales son los ingredientes que comparte cada una
/* usando W = [Ingredientes de la receta X] */
/* usando Z = [Ingredientes de la receta Y] */
/* usando I como miembro iterador sobre las listas de ingredientes de cada receta*/
/* usando C como la lista de ingredientes en comun*/
comparte_con(X,Y) :-
    receta(X,W),
    receta(Y,Z),
    X \= Y,
    findall(I,(member(I,W),member(I,Z)),C),
    C \= [],
    write('ingredientes: '),write(C),nl.
