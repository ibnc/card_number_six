/* These are 'Facts' */
borders(1,4).
borders(2,3).
borders(3,2).
borders(3,4).
borders(3,5).
borders(4,1).
borders(4,3).
borders(4,6).
borders(5,3).
borders(5,6).
borders(6,4).
borders(6,5).
borders(6,7).
borders(6,8).
borders(7,6).
borders(8,6).

/* These are 'Rules'
   Rules are Facts with bodies (aka 'Goals')
   In Prolog, "," stands for conjunction (aka and) while ";" stands for disjunction (aka or).
*/
next_to(A,B,List) :-
    indexOf(List, A, Index1),
    indexOf(List, B, Index2),
    Indexa is Index1 + 1,
    Indexb is Index2 + 1,
    borders(Indexa,Indexb).

not_next_to(A,B,List) :-
    not(next_to(A,B,List)).

is_next_to(A,[B,C],L) :-
  (next_to(A,B,L);
  next_to(A,C,L)).

valid_answer(PossibleAnswer) :-
  not_next_to(a1, a2, PossibleAnswer),
  not_next_to(k1, k2, PossibleAnswer),
  not_next_to(q1, q2, PossibleAnswer),
  not_next_to(j1, j2, PossibleAnswer),
  not_next_to(a1, q1, PossibleAnswer),
  not_next_to(a1, q2, PossibleAnswer),
  not_next_to(a2, q1, PossibleAnswer),
  not_next_to(a2, q2, PossibleAnswer),
  is_next_to(a1, [k1, k2], PossibleAnswer),
  is_next_to(a2, [k1, k2], PossibleAnswer),
  is_next_to(k1, [q1, q2], PossibleAnswer),
  is_next_to(k2, [q1, q2], PossibleAnswer),
  is_next_to(q1, [j1, j2], PossibleAnswer),
  is_next_to(q2, [j1, j2], PossibleAnswer).

print_results([]).
print_results([HEAD|TAIL]) :- /* [X|Y]: X is the first element in the list, and Y is list with X removed */
  write(HEAD),
  nl, /* print new line */
  print_results(TAIL).

card_list(X) :-
  X = [a1,a2,k1,k2,q1,q2,j1,j2].

ends_with_a2(LIST) :-
  last(LIST, LAST),
  LAST == a2.


find_ones_that_end_with_a2 :-
  card_list(CardList),
  findall(X, (permutation(CardList, X), valid_answer(X), ends_with_a2(X)), R),
  write("Solutions ending with a2:"),
  nl,
  print_results(R),
  nl.

card_number_six :-
  card_list(CardList),
  /*
     Findall finds all possible solutions, and gathers them into the last argument R
     In other words, you can read the bellow as:
     "find all valid answers for all permutations of CardList"
   */
  findall(X, (permutation(CardList, X), valid_answer(X)), R),
  write("valid answers:"),
  nl,
  print_results(R),
  length(R, LENGTH),
  write("There are "),
  write(LENGTH),
  write(" valid answers"),
  nl.
