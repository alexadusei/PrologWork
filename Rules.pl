/* 	
	DESCRIPTION: Program using predicates to determine if certain questions are
				 true, and what atoms fit into which structures that are true.
				 Facts are taking from Facts.pl
*/

% PART 1

vampire( Name) :-
	whedon( _Series, _Actor, Name, vampire).

category( Character, Category) :-
	whedon( _Series, _Actor, Character, Category).

twice( Actor) :-
	whedon( _Series, Actor, Character1, _Category),
	whedon( _, Actor, Character2, _),
	Character1 \= Character2.

hatTrick( Actor) :-
	whedon( buffy, Actor, _Character, _Category),
	whedon( angel, Actor, _, _),
	whedon( firefly, Actor, _, _).

% PART 2

hasOscar( Actor) :-
	oscar( award( _AwardName, _Year, winner), person( Actor, _Film)).

winner( Actor, Year, AwardName) :-
	oscar( award( AwardName, Year, winner), person( Actor, _Film)).

winner( Film, Year, AwardName) :-
	oscar( award( AwardName, Year, winner), film( Film)).

doubleNominee( Actor) :-
	oscar( award( Award1, Year1, _), person( Actor, Film1)),
	oscar( award( Award2, Year2, _), person( Actor, Film2)),
	(Award1 \= Award2; Year1 \= Year2; Film1 \= Film2).
