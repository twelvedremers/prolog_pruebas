
progenitor(tomas, jose).
progenitor(tomas,isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia,jaime).
hombre(tomas).
hombre(jose).
hombre(jaime).
mujer(isabel).
mujer(ana).
mujer(patricia).


abuelo(X,Y):- progenitor(X,Z),progenitor(Z,Y).
tio(X,Y):- hombre(X),progenitor(Z,Y), progenitor(V,Z), progenitor(V,X), X\=Z.
dif(X,Y):- X\=Y.

es_madre(Y):- progenitor(Y,_),mujer(Y).
es_padre(Y):- progenitor(Y,_),hombre(Y).
hermana_de(X,Y):- mujer(X),progenitor(Z,X),progenitor(Z,Y),dif(X,Y).
abuelo_de(X,Y):- hombre(X),progenitor(X,Z),progenitor(Z,Y).
abuela_de(X,Y):- mujer(X),progenitor(X,Z),progenitor(Z,Y).
hermanos(X,Y):- progenitor(Z,X),progenitor(Z,Y),dif(X,Y).
tia(X,Y):- mujer(X),progenitor(Z,Y), progenitor(V,Z), progenitor(V,X), X\=Z.
sucesor(X,Y):- progenitor(Y,Z),progenitor(Z,X).
predecesor(X,Y):-progenitor(X,Z),progenitor(Z,Y).
