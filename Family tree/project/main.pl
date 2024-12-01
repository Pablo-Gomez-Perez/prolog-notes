mujer(pamela).
mujer(laura).
mujer(ana).
mujer(beto).
mujer(tomas).
mujer(pablo).
mujer(jaime).

padre(pamela,beto).
padre(tomas,beto).
padre(tomas,laura).
padre(beto,ana).
padre(beto,pablo).
padre(pablo,jaime).

hijo(Y,X) :- padre(X,Y).
madre(X,Y) :- padre(X,Y), mujer(X).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).