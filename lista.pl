concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).
miembro(X,[S|R]):-concatenar(X,_,[S|R]);miembro(X,R).

dividir(X,Y,Z):-concatenar(Y,Z,X).
borrarDesde(X,Y,Z):-concatenar(Z,X1,X),concatenar(Y,_,X1).
tresUltimos(Z,Y):-concatenar(Y,[_,_,_],Z).

ultimoC(Z,Y):-concatenar(_,[Y],Z).
ultimoSC([Z],Z).
ultimoSC([_|R],Z):-ultimoSC(R,Z).

listaS([],_,[]).
listaS([X|R],X,Z):-listaS(R,X,Z).
listaS([X|R],Y,Z):-concatenar([X],X1,Z),listaS(R,Y,X1),X\=Y.

inversa([],[]).
inversa([X|L1],L):-inversa(L1,Resto),concatenar(Resto,[X],L).

%inversa(L1,L):- inversa (L1,[],L).
%inversa([],L,L).
%inversa([X|L1],L2,L3):- inversa(L1,[X|L2],L3).

agregarE(X,Y,[Y|X]).
palindromo(X,Y):- inversa(X,Y).

subconjunto([],_).
subconjunto([H|X],Y):-miembro(H,Y),subconjunto(X,Y).
subconjunto(_,[]).
subconjunto(Y,[H|X]):-miembro(H,Y),subconjunto(X,Y).

disyuncion([],_).
disyuncion(_,[]).
disyuncion([H|X],[H2|Y]):- H\=H2,disyuncion([H|X],Y),disyuncion(X,[H2|Y]).

consecutivo(L,A,B):-miembro([A,B],L).

nlista([],0).
nlista([_|L],V):-nlista(L,X),V is X+1.

par(L):-nlista(L,X),X1 is X mod 2, X1\=1.
inpar(L):-nlista(L,X),X1 is X mod 2, X1\=0.         

shift([],[]).
shift([H|X],T):-concatenar(L,[R,H],T),cuerpo(X,L,R).

cuerpo([X],[],X).
cuerpo([H|X],L,Z):-concatenar([H],H1,L),cuerpo(X,H1,Z).

permutacion([],[]).
permutacion(P,[H|X]):-concatenar(Xs,[H|Ys],P),concatenar(Xs, Ys,Zs),permutacion(Zs,X).

%traslacion

trasladar([],[]).
trasladar([H1|X],[H2|Y]):-significado(H1,H2),trasladar(X,Y).

significado(0,cero).
significado(1,uno).
significado(2,dos).
significado(3,tres).
significado(4,cuatro).
significado(5,cinco).
significado(6,seis).
significado(7,siete).
significado(8,ocho).
significado(9,nueve).

pos_y_neg([],0,0).
pos_y_neg([Xh|Xs],P,N):-Xh >= 0, ! ,pos_y_neg(Xs,P1,N),P is P1+1.
pos_y_neg([_|Xs],P,N):-pos_y_neg(Xs,P,N1),N is N1+1.

pos_y_neg1([],[],0,[],0).
pos_y_neg1([Xh|Xs],[Xh|Ps],P,Ns,N):-Xh >= 0 , ! ,pos_y_neg1(Xs,Ps,P1,Ns,N),P is P1+1 .
pos_y_neg1([Xh|Xs],Ps,P,[Xh|Ns],N):- pos_y_neg1(Xs,Ps,P,Ns,N1),N is N1+1 .

par_impar([],[],[]).
par_impar([Xh|Xs],[Xh,P],I):- (Xh mod 2)=0 , ! ,par_impar(Xs,P,I).
par_impar([Xh|Xs],P,[Xh|I]):-par_impar(Xs,P,I).

maximo([X],X).
maximo([X|Xs],X):-maximo(Xs,X1),X>=X1,!.
maximo([_|Xs],X1):-maximo(Xs,X1).

minimo([X],X).
minimo([X|Xs],X):- minimo(Xs,X1),X1>=X,!.
minimo([_|Xs],X1):- minimo(Xs,X1).

aparicion([],_,0).
aparicion([X|Xs],X,N):-aparicion(Xs,X,N1),N is N1+1,!.
aparicion([_|Xs],X,N):-aparicion(Xs,X,N).



