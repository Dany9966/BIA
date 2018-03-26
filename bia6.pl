inserting(Item,List,[Item|List]).
inserting(Item,[Head|List],Result) :-
	inserting(Item,List,RR),
	append([Head],RR,Result).

deleteone(Item,[Item|List],List).
deleteone(Item,[Head|List],Result) :-
	deleteone(Item,List,RR),
	append([Head],RR,Result).

predecessors(Item,EntireList,ListOfPredecessors) :-
	append(ListOfPredecessors,[Item|_],EntireList).

successors(Item,EntireList,ListOfSuccessors) :-
	append(_,[Item|ListOfSuccessors],EntireList).

deleteall(Item,List,List) :- not(member(Item,List)).
deleteall(Item,[Item|List],Result) :- deleteall(Item,List,Result).
deleteall(Item,List,Result) :-
	deleteone(Item,List,RR),
	deleteall(Item,RR,Result).

range(Stop,Stop,[Stop]).
range(Start,Stop,Result) :-
	St1 is Start+1,
	range(St1,Stop,RR),
	append(Start,RR,Result).
