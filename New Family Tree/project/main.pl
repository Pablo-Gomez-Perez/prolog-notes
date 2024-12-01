mujer(eloisa).
mujer(maria).
mujer(flor).
mujer(amparo).
mujer(blanca).
mujer(bili).
mujer(claudia).
mujer(lourdes).
mujer(noely).
mujer(valentina).
mujer(cecilia).
mujer(mariana).
mujer(katherine).
mujer(paula).
hombre(tomas).
hombre(florentino).
hombre(elmar).
hombre(gabriel).
hombre(filomeno).
hombre(juan).
hombre(caralampio).
hombre(miguel).
hombre(jorge).
hombre(pablo).
hombre(alejandro).
hombre(leon).
hombre(yamil).
hombre(alberto).
hombre(german).
hombre(miguelito).
hombre(antonio).

padre(eloisa,elmar).
padre(eloisa,amparo).
padre(tomas,elmar).
padre(tomas,amparo).
padre(maria,gabriel).
padre(maria,blanca).
padre(maria,bili).
padre(maria,claudia).
padre(maria,lourdes).
padre(florentino,gabriel).
padre(florentino,blanca).
padre(florentino,bili).
padre(florentino,claudia).
padre(florentino,lourdes).
padre(flor,jorge).
padre(flor,fara).
padre(elmar,jorge).
padre(elmar,fara).
padre(amparo,pablo).
padre(amparo,valentina).
padre(gabriel,pablo).
padre(gabriel,valentina).
padre(blanca,alejandro).
padre(filomeno,alejandro).
padre(bili,leon).
padre(bili,yamil).
padre(juan,leon).
padre(juan,yamil).
padre(claudia,alberto).
padre(claudia,german).
padre(caralampio,alberto).
padre(caralampio,german).
padre(lourdes,miguelito).
padre(lourdes,mariana).
padre(noely,katherine).
padre(noely,paula).
padre(pablo,katherine).
padre(pablo,paula).
padre(german,antonio).
padre(german,dylan).
padre(cecilia,antonio).
padre(cecilia,dylan).
pareja(flor,elmar).
pareja(elmar,flor).
pareja(amparo,gabriel).
pareja(gabriel,amparo).
pareja(blanca,filomeno).
pareja(blanca,filomeno).
pareja(bili,juan).
pareja(juan,bili).
pareja(claudia,caralampio).
pareja(caralampio,claudia).
pareja(lourdes,miguel).
pareja(miguel,lourdes).
pareja(eloisa,tomas).
pareja(tomas,eloisa).
pareja(maria,florentino).
pareja(florentino,maria).
pareja(noely,pablo).
pareja(pablo,noely).
pareja(german,cecilia).
pareja(cecilia,german).

papa(X,Y) :- padre(X,Y),hombre(X).
mama(X,Y) :- padre(X,Y),mujer(X).
hijo(X,Y) :- padre(Y,X),hombre(X).
hija(X,Y) :- padre(Y,X),mujer(X).
abuelo(X,Y) :- padre(X,Z),padre(Z,Y),hombre(X).
abuela(X,Y) :- padre(X,Z),padre(Z,Y),mujer(X).
hermano(X,Y) :- padre(Z,X),padre(Z,Y),hombre(X), X \= Y.
hermana(X,Y) :- padre(Z,X),padre(Z,Y),mujer(X), X \= Y.
hermanos(X,Y) :- padre(Z,Y),padre(Z,X). % hermanos genericos
tio(X,Y) :- padre(Z,Y),hermanos(X,Z),hombre(X) ; padre(Z,Y),hermanos(Z,W),pareja(W,X),hombre(X).
tia(X,Y) :- padre(Z,Y),hermanos(X,Z),mujer(X) ; padre(Z,Y),hermanos(Z,W),pareja(W,X),mujer(X).
primo(X,Y) :- hijo(X,Z),tio(Z,Y) ; hijo(X,Z), tia(Z,Y).
prima(X,Y) :- hija(X,Z),tio(Z,Y) ; hija(X,Z), tia(Z,Y).
bisabuelo(X,Y) :- abuelo(X,Z), padre(Z,Y), hombre(X).
bisabuela(X,Y) :- abuelo(X,Z), padre(Z,Y), mujer(X).