movimiento_forzoso(Tablero,Cas):-en_linea(Casillas),amenaza(Casillas,Tablero,Cas), !.
enlinea([1,2,3]).
enlinea([4,5,6]).
enlinea([7,8,9]).
enlinea([1,4,7]).
enlinea([2,5,8]).
enlinea([3,6,9]).
enlinea([1,5,9]).
enlinea([3,5,7]).
amenaza([X,Y,Z],B,X):-vacio(X,B), cruz(Y,B), cruz(Z,B).
amenaza([X,Y,Z],B,Y):-vacio(Y,B), cruz(X,B), cruz(Z,B).
amenaza([X,Y,Z],B,Z):-vacio(Z,B), cruz(X,B), cruz(Y,B).
vacio(Cas,Tablero):- arg(Cas,Tablero,Val), Val=v.
cruz(Cas,Tablero):- arg(Cas,Tablero,Val), Val=x.
cara(Cas,Tablero):- arg(Cas,Tablero,Val), Val=o.
arg(Num,Lista,Valor):- arg(Num,1,Lista,Valor).
arg(N,N,[X|_],X).
arg(N,N1,[_|L],Valor):-N2 is N1 + 1,arg(N,N2,L,Valor).