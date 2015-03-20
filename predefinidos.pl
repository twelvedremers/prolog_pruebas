pp([H|T],I):- !, J is I+3, pp(H,J), ppx(T,J), nl.
pp(X,I):- tab(I), write(X), nl.
ppx([],_).
ppx([H|T],I):- pp(H,I), ppx(T,I).

tab(0):- !.
tab(N):- put(32), tab(M), M is N-1.

Calle(1,1,2,1).
calle(1,1,1,2).
calle(1,2,1,3).
calle(1,2,2,3).
calle(1,3,1,4).
calle(2,3,3,4).
calle(1,4,1,5).
calle(1,5,2,5).
calle(2,5,3,5).
calle(3,4,3,5).
calle(3,5,4,5).
calle(4,5,5,5).
calle(2,1,3,1).
calle(3,1,4,1).
calle(4,1,5,1).
calle(5,1,5,2).
calle(5,2,5,3).
calle(5,3,5,4).
calle(5,4,5,5).
calle(5,2,4,3).
calle(4,3,3,4).

ir([Salidax,Saliday],[Destinox,Destinoy],Ruta):-ir0([Salidax,Saliday],[Destinox,Destinoy],[],R),inv(R,Ruta).ir0([Dx,Dy],[Dx,Dy],T,[[Dx,Dy]|T]).

ir0([Sx,Sy],[Dx,Dy],T,R):-nodolegal([Sx,Sy],T,[Sigx,Sigy]),ir0([Sigx,Sigy],[Dx,Dy],[[Sx,Sy]|T],R).

nodolegal([Sx,Sy],Camino,[Sigx,Sigy]):-(calle(Sx,Sy,Sigx,Sigy);calle(Sigx,Sigy,Sx,Sy)),not(member([Sigx,Sigy],Camino)).