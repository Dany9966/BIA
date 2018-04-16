
:- dynamic(edge/3).
:- dynamic(node/1).
:- dynamic(visited/1).


select(1) :-
	write('Adauga nodul: '),
	read(Node),
	assert(node(Node)),
	menu.

select(2) :-
	write('Sterge nodul: '),
	read(Node),
	node(Node),
	retract(node(Node)),
	retractall(edge(Node,_,_)),
	retractall(edge(_,Node,_)),
	menu.

select(3) :-
	write('Adauga de la nodul: '),
	read(NodeA),
	node(NodeA),
	write('Pana la: '),
	read(NodeB),
	node(NodeB),
	write('Cost: '),
	read(Cost),
        assert(edge(NodeA, NodeB, Cost)),
	menu.

select(4) :-
	write('Sterge de la nodul: '),
	read(NodeA),
	node(NodeA),
	write('Pana la: '),
	read(NodeB),
	node(NodeB),
	retractall(edge(NodeA, NodeB, _)),
	menu.

select(5) :-
	findall(edge(X, Y, Z), edge(X, Y, Z), Results),
	write(Results), nl, menu.

select(6) :-
	write('De la nodul: '),
	read(NodeA),
	node(NodeA),
	write('la nodul: '),
	read(NodeB),
	node(NodeB).
select(7) :-
	!.
menu :-	write('Meniu:'), nl,
	write('\t1.Adauga nod'), nl,
	write('\t2.Sterg nod'), nl,
	write('\t3.Adauga muchie'), nl,
	write('\t4.Sterge muchie'), nl,
	write('\t5.Print graph'), nl,
	write('\t6.Shortest path'), nl,
	write('\t7.Exit'), nl,
	write('Choose your destiny: '),
	read(Nmb),
	select(Nmb).

