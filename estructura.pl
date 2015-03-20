
tiene(juan,libro(don_quijote,autor(miguel,cervantes),3256)).
vertical(segmento(punto(X,Y1),punto(X,Y2))).
horizontal(segmento(punto(X1,Y),punto(X2,Y))).

segmento(X,Y):-	X = punto(X1,Y1), Y = punto(X2,Y2),X1 = X2, X1 = 5 .

regular(R):- R = rectangulo(p1(X1,Y1),p2(X2,Y2),p3(X3,Y3),p4(X4,Y4)) , Y1 = Y2 , X1 = X3 , Y3 = Y4 , X2 = X4  .

f(1,uno).
f(s(1),dos).
f(s(s(1)),tres).
f(s(s(s(X))),N):- f(X,N).


progenitor(clara,jose).
progenitor(tomas, jose).
progenitor(tomas,isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia,jaime).
progenitor(tomas, maria).
mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).
hermana_de(X,Y):- mujer(X), progenitor(Z,X), progenitor(Z,Y).
tia(X,Y):- hermana_de(X,Z), progenitor(Z,Y).


%tipos

