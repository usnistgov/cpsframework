% ------ Input Interface ------

property(P) :- input(P,"rdf:type","cpsf:Property").
descr(P,D) :- input(P,"rdfs:comment",D).
atomic_statement(P,A) :- input(P,"cpsf:atomicStatement",A).
isAssertion(P) :- input(P,"cpsf:hasType","cpsf:PropertyType_Assertion").
concern(S) :- input(S,"cpsf:includesConcern",O).
concern(O) :- input(S,"cpsf:includesConcern",O).
subconcern(S,O) :- input(S,"cpsf:includesConcern",O).
addressedBy(C,P) :- input(C,"cpsf:addressedByProperty",P).

-aspect(A) :-
	subconcern(_,A).

aspect(A) :-
	concern(A),
	not -aspect(A).

-isAssertion(P) :- property(P), not isAssertion(P).

% Identify the last step in the input
last_step(S) :-
	step(S),
	S2=S+1,
	not step(S2).


% ------ Theory ------

% A property is satisfied only if we have concrete evidence that
% all corresponding atomic statements hold.
% If we are uncertain about even just one, then the property is not satisfied.
-holds(sat_property(A),S) :-
	step(S),
	atomic_statement(P,A),
	isAssertion(P),
	not holds(A,S).

-holds(sat_concern(C),S) :-
	step(S),
	addressedBy(C,P),
	atomic_statement(P,A), 
	-holds(sat_property(A),S).

-holds(sat_concern(C1),S) :-
	step(S),
	subconcern(C1,C2),
	-holds(sat_concern(C2),S).

holds(sat_concern(C),S) :-
	step(S),
	concern(C),
	not -holds(sat_concern(C),S).

-holds(sat_all,S) :-
	step(S),
	aspect(A),
	-holds(sat_concern(A),S).

holds(sat_all,S) :-
	step(S),
	not -holds(sat_all,S).

% initial state of the CPS
fluent(A) :- atomic_statement(P,A).
fluent(A) :- config_feature(A).

holds(F,0) :-
	fluent(F),
	obs(F,true).

-holds(F,0) :-
	fluent(F),
	obs(F,false).

holds(F,0) :-
	fluent(F),
	assumed(F,true),
	not -holds(F,0).

-holds(F,0) :-
	fluent(F),
	assumed(F,false),
	not holds(F,0).

% next state: inertia axioms
is_defined(F) :- fluent(F), defined(M,F).

holds(F,S2) :-
	fluent(F),
	not is_defined(F),
	step(S), step(S2), S2=S+1,
	holds(F,S),
	not -holds(F,S2).

-holds(F,S2) :-
	fluent(F),
	not is_defined(F),
	step(S), step(S2), S2=S+1,
	-holds(F,S),
	not holds(F,S2).

holds(F,S) :-
	fluent(F),
	defined(neg,F),
	step(S),
	not -holds(F,S).

-holds(F,S) :-
	fluent(F),
	defined(pos,F),
	step(S),
	not holds(F,S).

% effect of a negative impact
-holds(A,S) :-
	impacted(neg,A,S).
