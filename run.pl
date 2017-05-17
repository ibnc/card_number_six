#!/usr/bin/env swipl

/* this is how you load other predicates from another file */
:-['load.pl'].

/* this tells prolog what predicate to call when the script first runs */
:- initialization main.

main :-
  card_number_six,
  halt.
