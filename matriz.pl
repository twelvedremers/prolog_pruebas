%POSIBLES VALORES

numeros(1).
numeros(2).
numeros(3).
numeros(4).
numeros(5).
numeros(6).
numeros(7).
numeros(8).
numeros(9).
numeros(0).
operador(+).
operador(-).
operador(*).
operador(/).

% la primer elemento es a que casilla de respuenta esta relacionada ,la segunda los valores que la conforman

lineas(1,[1,3,5]).
lineas(2,[11,13,15]).
lineas(3,[21,23,25]).
lineas(4,[1,11,21]).
lineas(5,[3,13,23]).
lineas(6,[5,15,25]).
operadores(1,[2,4]).
operadores(2,[12,14]).
operadores(3,[22,24]).
operadores(4,[6,16]).
operadores(5,[8,18]).
operadores(6,[10,20]).


%metodos auxiliares

%imprimir una matriz 5 x 5 junto a su resultado

imprimir(Xs,Ys):-nl,imprimir(Xs,Ys,1).
imprimir([],[X1,X2,X3|_],_):-write('='),write('   '),write('='),write('   '),write('='),nl,write(X1),write('   '),write(X2),write('   '),write(X3),nl,nl,!.
imprimir([X1,X2,X3,X4,X5|CUERPO],[X6|Resultado],N):-N mod 2 =:= 1,!, write(X1),write(' '),write(X2),write(' '),write(X3),write(' '),write(X4),write(' '),write(X5),write(' '),write('= '),write(X6),nl,N1 is N+1,imprimir(CUERPO,Resultado,N1).
imprimir([X1,_,X3,_,X5|CUERPO],Resultado,N):- write(X1),write('   '),write(X3),write('   '),write(X5),nl,N1 is N+1,imprimir(CUERPO,Resultado,N1).

%me da el valor de la casilla dado la ubicacion
posicion(Num,Lista,Valor):- posicion(Num,1,Lista,Valor).
posicion(N,N,[X|_],X).
posicion(N,N1,[_|L],Valor):-N2 is N1 + 1,posicion(N,N2,L,Valor).

%me devuelve el resultado de la operacion de un vector con 3 valores y 2 operadores
valor([X1,O1,X2,O2,X3],R2):-numeros(X1),numeros(X2),numeros(X3),operador(O1),operador(O2),operacion(O1,X1,X2,R1),operacion(O2,R1,X3,R2).

%me genera la operacion dependiendo el valor que entra
operacion(+,A,B,R):-R is A+B.
operacion(-,A,B,R):-R is A-B.
operacion(*,A,B,R):-R is A*B.
operacion(/,A,B,R):-R is A/B.

%me devuelve la traduccion de las casillas del vector.
valores([],_,[]).
valores([X|Xs],MatrizO,[R|Rs]):-posicion(X,MatrizO,R),valores(Xs,MatrizO,Rs).


%programa principal

principal(Xs,Ys):-valida(Xs,Ys,1).

valida(Xs,Ys,7):-imprimir(Xs,Ys),!.
valida(Xs,Ys,N):-lineas(N,[A1,A2,A3]),operadores(N,[B1,B2]),valores([A1,B1,A2,B2,A3],Xs,[C1,D1,C2,D2,C3]),
posicion(N,Ys,V),valor([C1,D1,C2,D2,C3],V),N1 is N+1,valida(Xs,Ys,N1).


/* matriz de ejemplo

   1  + X + 3  = 5
   +    Y1  +
   2 Y2 4 - 0  = 8
   Y    +   *
   3  - 2 + 5  = Z1 
   =    =   =
   Z2    6  Z3
              
  principal([1,+,X,+,3,+,-1,Y1,-1,+,2,Y2,4,-,0,Y,-1,+,-1,*,3,-,2,+,5],[5,8,Z1,Z2,6,Z3])

               */
