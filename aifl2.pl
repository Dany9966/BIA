father(andrew,mary).
father(wayne,andrew).
father(wayne,molly).
father(andrew,daniel).
father(daniel,jack).
father(andrew,bob).
father(bob,paul).
father(bob,mike).
child(X,Y) :- father(Y,X).
brother(X,Y) :- child(X,Z),child(Y,Z),not(X=Y).
pred(X,Y) :- father(X,Y) ; father(Z,Y),pred(X,Z).
nephew(X,Y) :- brother(Y,Z),child(X,Z).
grandchild(X,Y) :- child(X,Z),child(Z,Y),not(X=Y).

