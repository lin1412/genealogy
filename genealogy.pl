/* --------------------------------------
* At a recent family gathering, the oldest people present were the twins, Alice and Claude.
* Alice is married to Bob, and Claude is married to Dianna.
* All of Alice and Bob's children were in attendance: Edward, Florence
and Grace.
* Grace brought her husband Keith and their child Harry.
* Grace's sister-in-law, Jennifer (Edward's wife), came too.
* Edward brought his child, Iona.
*---------------------------------------*/

/* --- Facts ---*/
brother(claude, alice).
brother(edward, florence).
brother(edward, grace).

sister(alice, claude).
sister(florence, edward).
sister(florence, grace).
sister(grace, edward).
sister(grace, florence).

husband(bob, alice).
husband(claude, dianna).
husband(edward, jennifer).
husband(keith, grace).

father(bob, edward).
father(bob, florence).
father(bob, grace).
father(edward, iona).
father(keith, harry).

/* --- Rules --- */
spouse(X, Y) :- (husband(X, Y); husband(Y, X)).
sibling(X, Y) :- (brother(X, Y); sister(X, Y)).
mother(X, Y) :- (father(U, Y), husband(U, X)).
parent(X, Y) :- (father(X, Y); mother(X,Y)).
grandfather(X, Y) :- ((father(X, U), father(U, Y)); (father(X, U), mother(U, Y))).
grandmother(X, Y) :- ((mother(X, U), father(U, Y)); (mother(X, U), mother(U, Y))).
aunt(X, Y) :- ((sister(X, U), parent(U, Y)); (husband(U, X), brother(U, P), parent(P, Y))).
uncle(X, Y) :- ((brother(X, U), parent(U, Y)); (husband(X, U), sister(U, P), parent(P, Y))).
grandparent(X, Y) :- (grandfather(X, Y); grandmother(X,Y)).
greataunt(X, Y) :- ((sister(X, U), grandparent(U, Y)); (husband(U, X), brother(U, P), grandparent(P, Y))).
greatuncle(X, Y) :- ((brother(X, U), grandparent(U, Y)); (husband(X, U), sister(U, P), grandparent(P, Y))).


