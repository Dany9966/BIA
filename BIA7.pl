:- op(500, fx, the).
:- op(1000, xfx, of).
:- op(1050, xfx, was).
was(john,of(the(secretary),the(department))).

select('stop') :- !.

select(Number) :-
	Result is Number ** 2,
	writef('%d ^ 2 = %d', [Number, Result]),nl,
	squares.

squares :-
	write('Enter a number: '),
	read(Number),
	select(Number).

writelist([]) :-
	write('').

writelist([Head|Tail]) :-
	write(Head), write(' '), writelist(Tail).

% deleting(from(1,[1,2,4,1,3]),gives([2,4,3])).
% gives([2,4,3], deleting(from(1, [1,2,4,1,3])).
:- op(700, xfx, gives).
:- op(700, xfx, givess).
:- op(500, fx, deleting).
:- op(200, xfx, from).
:- op(200, xfy, and).
:- op(500, fx, concatenating).

deleteitem(_, [], []).
deleteitem(Item, [Item|Tail], Result) :-
	deleteitem(Item, Tail, Result).

deleteitem(Item, [Head|Tail], [Head|Result]) :-
	not(Item == Head),
	deleteitem(Item, Tail, Result).

gives(deleting(from(Item, List)), Result) :-
	deleteitem(Item, List, Result).

concatenate(L1, L2, Result) :-
	is_list(L2),
	append(L1, L2, Result).

concatenate(L1, and(L2,L3), Result) :-
	concatenate(L2,L3,RR),
	append(L1, RR, Result).



givess(concatenating(and(L1,L2)), Result) :-
	concatenate(L1, L2, Result).
