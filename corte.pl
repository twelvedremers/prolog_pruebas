concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

interseccion([],_,[]).
interseccion([X|Xs],Ys,[X|Zs]):-member(X,Ys),!,interseccion(Xs,Ys,Zs).
interseccion([_|Xs],Ys,Zs):-interseccion(Xs,Ys,Zs).

union([],Xs,Xs).
union([X|Xs],Ys,[X|Zs]):-not(member(X,Ys)),!,union(Xs,Ys,Zs).
union([_|Xs],Ys,Zs):-union(Xs,Ys,Zs).

diferencia([],_,[]).
diferencia([X|Xs],Ys,[X|Zs]):-not(member(X,Ys)),!,diferencia(Xs,Ys,Zs).
diferencia([_|Xs],Ys,Zs):-diferencia(Xs,Ys,Zs).

aplanar([],[]).
aplanar([[X|Xs]|Xss],Ys):-aplanar([X|Xs],Zs),concatenar(Zs,Ts,Ys),aplanar(Xss,Ts),!.
aplanar([[]|Xs],Ys):-aplanar(Xs,Ys),!.
aplanar([X|Xs],[X|Ys]):-aplanar(Xs,Ys).

cambiar(tu,yo).
cambiar(eres,[no,soy]).
cambiar(hablas,[no,hablo]).
cambiar(frances,aleman).
cambiar(X,X).

traductor([],[]).
traductor([X|Xs],Ys):-cambiar(X,[Z|Zs]),concatenar([Z|Zs],Ts,Ys),!,traductor(Xs,Ts).
traductor([X|Xs],[Z|Ts]):-cambiar(X,Z),traductor(Xs,Ts).

miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).
miembro(X,[S|R]):-concatenar(X,_,[S|R]);miembro(X,R).

p(1).
p(2):- !.
p(3).

agregar(X,Xs,[X|Xs]):-not(miembro(X,Xs)),!.
agregar(_,Xs,Xs).

clase(0,cero):-!.
clase(Numero,positivo):- Numero>0,!.
clase(_,negativo).	

divide([X|Xs],[X|P],N):-X>=0,divide(Xs,P,N),!.
divide([X|Xs],P,[X|N]):-divide(Xs,P,N).

no(1,0).
no(0,1).
no([],[]):-!.
no([no,no|Xs],Ys):-no(Xs,Ys),!.
no([no,X|Xs],[Y|Ys]):-no(X,Y),!,no(Xs,Ys).
no([X|Xs],[X|Ys]):-no(Xs,Ys).
no(X,X). % el recogetodo

and(1,1,1):-!.
and(_,_,0).
and([],1):-!.
and([0|_],0):-!.
and([_|Xs],Z):-and(Xs,Z).

logica([X|Xs],Ys):-no([X|Xs],Zs),and(Zs,Ys),!.


alfabeto([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]).

desde(X,[X|L],[X|L]):-!.
desde(X,[_|L],Z):-desde(X,L,Z).

hasta(X,L,Z):-desde(X,L,[X|T]),concatenar(Z,T,L).

desde_hasta(A,B,L,L1):-desde(A,L,X1),hasta(B,X1,L1).

ordenar([],X,X):-!.
ordenar(X,[],X):-!.
ordenar([X|Xs],[Y|Ys],[X|Ts]):- Y>=X,ordenar(Xs,[Y|Ys],Ts),!.
ordenar(Xs,[Y|Ys],[Y|Ts]):-ordenar(Xs,Ys,Ts).