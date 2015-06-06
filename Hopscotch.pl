/* 	
	DESCRIPTION: Program based on a game of hopscotch. Finds and picks the best
					'hopping' combination of squares to jump on, in terms of
					2 or 3 jumps, which the highest score on each square.
					Prolog Edition!!
*/

/* Main predicate that uses auxiliary predicate bestPerm so recursively find the
   best permutation of the best path. Used in conjunction with setof to prevent
   multiples of the same answer. */

hopscotch( Squares, Best) :-
	setof(_,bestPerm(Squares, Best),_).


/* 	Auxiliary function to help 'hopscotch'. Recursively breaks the list into
	smaller ones, which two jumps or three. Checks if the sum of the recursive
	call with two jumps is greater than the one with three jumps, if so, it will
	continue down a two-jump recursive call, otherwise it will continue down
	a three-jump call, and returns that list (which is the best list with
	the highest score) */

bestPerm( [], []).
bestPerm( [X], [X]).
bestPerm( [X,_], [X]).

bestPerm( [X,_,Z|Tail], [X|Path]) :- 
	bestPerm( [Z|Tail], Path1), 
	bestPerm( Tail, Path2),
	sum_list( Path1, Result1),
	sum_list( Path2, Result2),
	Result1 >= Result2,
	bestPerm( [Z|Tail], Path).

bestPerm( [X,_,Z|Tail], [X|Path]) :-
	bestPerm( [Z|Tail], Path1), 
	bestPerm( Tail, Path2),
	sum_list( Path1, Result1),
	sum_list( Path2, Result2),
	Result1 =< Result2,
	bestPerm( Tail, Path).
