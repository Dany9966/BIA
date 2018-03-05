abs(X,Y) :-
      X<0,
      Y is -X, !.

abs(X,X).


fibonacci(0,0) :- !.
fibonacci(1,1) :- !.
fibonacci(N,F) :-
	NX is N-1,
	NXX is NX-1,
        fibonacci(NX,FX),
	fibonacci(NXX,FXX),
	F is FX+FXX.

divisor(X,0,X) :- !.
divisor(0,Y,Y) :- !.
divisor(X,Y,D) :-
	YP is X mod Y,
	divisor(Y,YP,D).

eval(N,N) :-
	number(N).

eval(E1+E2,V) :-
	eval(E1,R1),
	eval(E2,R2),
	plus(R1,R2,V).

eval(E1-E2,V) :-
	eval(E1,R1),
	eval(E2,R2),
	plus(R2,V,R1).

