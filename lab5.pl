null.
tree(_,null,null) :- !.
tree(_, tree(_,_,_),tree(_,_,_)) :-
!.
present(Key,tree(Key,_,_)) :- !.
present(Key,tree(_,Ltree,_)) :-
	present(Key,Ltree).
present(Key,tree(_,_,Rtree)) :-
	present(Key,Rtree).
add(null, 0) :- !.
add(tree(Key,null,null),Key) :- !.
add(tree(Key,Ltree,Rtree),S) :-
        add(Ltree,SI),
	add(Rtree,SII),
	S is SI + SII + Key.
count_leaves(null,0) :- !.
count_leaves(tree(_,null,null), 1) :-
	!.
count_leaves(tree(_,Ltree,Rtree),Count) :-
	count_leaves(Ltree,CI),
	count_leaves(Rtree,CII),
	Count is CI + CII.

compute(tree(Key,null,null),Key) :- !.
compute(tree(+,Ltree,Rtree),Result) :-
	compute(Ltree,RI),
	compute(Rtree,RII),
	Result is RI + RII.

compute(tree(-,Ltree,Rtree),Result) :-
	compute(Ltree,RI),
	compute(Rtree,RII),
	Result is RI - RII.
compute(tree(*,Ltree,Rtree),Result) :-
	compute(Ltree,RI),
	compute(Rtree,RII),
	Result is RI * RII.

compute(tree(/,Ltree,Rtree),Result) :-
	compute(Ltree,RI),
	compute(Rtree,RII),
	Result is RI / RII.

converting(N,tree(N,null,null)) :-
	number(N), !.
converting(E1+E2,tree(+, R1, R2)) :-
	converting(E1,R1),
	converting(E2,R2).
converting(E1-E2,tree(-, R1, R2)) :-
	converting(E1,R1),
	converting(E2,R2).
converting(E1*E2,tree(*, R1, R2)) :-
	converting(E1,R1),
	converting(E2,R2).
converting(E1/E2,tree(/, R1, R2)) :-
	converting(E1,R1),
	converting(E2,R2).























