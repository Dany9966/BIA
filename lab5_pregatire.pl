% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

%member(Item,List)
present(Item,[Item|_]).
present(Item,[_|T]) :- present(Item,T).

%append
concatenating([],L,L).
concatenating([Head|Tail],List,[Head|Result]) :- concatenating(Tail,List,Result).

predecesori(Item,List,Result) :- append(Result,[Item|_],List).
succesori(Item,List,Result) :- append(_,[Item|Result],List).

inserting(Key,List,[Key|List]).
inserting(Key,[Head|Tail],[Head|Result])   :- inserting(Key,Tail,Result).

del-one(Item,[Item|Tail],Tail).
del-one(Item,[Head|Tail],[Head|Result]) :- del-one(Item,Tail,Result).

del-all(_,[],[]):-!.
del-all(Item,[Item|Tail],Result) :- del-all(Item,Tail,Result),!.
del-all(Item,[Head|Tail],[Head|Result]) :- del-all(Item,Tail,Result).

range(X,X,[X]):-!.
range(X,Y,List) :- X<Y, Z is X+1,range(Z,Y,List1),append([X],List1,List).

flatten([],[]):-!.
flatten([H|T],Re) :- is_list(H),flatten(H,R1),flatten(T,R2),append(R1,R2,Re),!.
flatten([H|T],[H|Re]) :- flatten(T,Re).


%reverse
inverting([],[]):-!.
inverting([H|T],List) :- inverting(T,List2),append(List2,[H],List).


duplicate([],[]).
duplicate([H|T],[[H|[H]]|Result]) :- duplicate(T,Result).

rotate(List,1,[H|T]) :- append(T,[H],List).
rotate(List,N,R) :- N>1, N2 is N-1, rotate(List,1,R2),rotate(R2,N2,R).














