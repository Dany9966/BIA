inserting(Item,List,[Item|List]).
inserting(Item,[Head|List],Result) :-
	inserting(Item,List,RR),
	append([Head],RR,Result).

deleteone(Item,[Item|List],List).
deleteone(Item,[Head|List],Result) :-
	deleteone(Item,List,RR),
	append([Head],RR,Result).

delete_first(Item,[Item|List],List) :- !.

delete_first(Item,[Head|List],Result) :-
	delete_first(Item,List,RR),
	append([Head],RR,Result).

deleteall(Item,List,List) :- not(member(Item,List)), !.
deleteall(Item,[Item|List],Result) :- deleteall(Item,List,Result).
deleteall(Item,List,Result) :-
	delete_first(Item,List,RR),
	deleteall(Item,RR,Result).

range(Start,Stop,[Stop]) :- Start == Stop, !.
range(Start,Stop,[Start|Tail]) :-
	St1 is Start + 1,
	range(St1, Stop,Tail).

delete_last(Item,[Head|Item], Head) :- length([Head|Item], 1), !.


rotate(List,0,List) :- !.
rotate(List,C,Result) :-
	CC is C - 1,
	last(List,Last),
	rotate([Last|List],CC,Result).
