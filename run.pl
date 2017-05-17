#!/usr/bin/env swipl

/*
* The files run.pl and load.pl are "standard" special files
* see: http://www.swi-prolog.org/pldoc/man?section=project-special-files
*/

/* this is how you load other predicates from another file */
:-['load.pl'].

/* this tells prolog what predicate to call when the script first runs */
:- initialization main.

main :-
  card_number_six,
  halt.
