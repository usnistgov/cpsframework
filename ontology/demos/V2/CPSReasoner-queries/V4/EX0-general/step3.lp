% Step 3 -- to be used together with step2.lp
% A cyberattack has occurred and hacked the SAM to switch 
% input device 1 to fast-mode.
% The attack affects the SAM and its effect cannot be directly reversed 
% in order to lower the operating mode of input device 1.
% We want to know if there is a mitigation and, if so, which one.
%
% Outcome:
%   * Replacing the basic input device 1 with the advanced type solves the
%     problem. The advanced input device 1 can operate in fast-mode
%     with encrypted memory enabled.
%
% Questions:
%   1. Is the functionality concern satisfied now?
%   2. Is the functional aspect satisfied now?
%   3. Are all aspects satisfied now?
%   4. What is the mitigation?
% 
% Answers:
%   1. Yes (because the advanced input device 1 can operate
%           in fast-mode without compromising functionality)
%   2. Yes (because all concerns and sub-concerns of functional
%           aspect are satisfied)
%   3. Yes (because all aspects are satisfied)
%   4. Replace the basic input device 1 with the advanced one

step(2).

action(enable(C)) :- config_feature(C).
action_descr(enable(C),enable(D)) :- config_feature(C), descr(C,D).
action(disable(C)) :- config_feature(C).
action_descr(disable(C),disable(D)) :- config_feature(C), descr(C,D).

do(A,S) v -do(A,S) :- step(S), action(A), not last_step(S).
%%%%:- step(S), do(A1,S), do(A2,S), A1!=A2.

% Minimize the number of actions
:~ do(A,S), action(A), step(S).

% EXAMPLE-SPECIFIC: do not execute actions before the cyberattack
:- step(S1), step(S2), S1<=S2, action(A), do(A,S1), occurs(cyberattack,S2).

% Effects of actions
holds(F,S2) :-
	step(S), step(S2), S2=S+1,
	fluent(F),
	do(enable(F),S).
:- step(S), do(enable(F),S), holds(F,S).
-holds(F,S2) :- 
	step(S), step(S2), S2=S+1,
	fluent(F),
	do(disable(F),S).
:- step(S), do(disable(F),S), -holds(F,S).

:- last_step(S), -holds(sat_all,S).

output(D,action,S) :- step(S), action(A), do(A,S), action_descr(A,D).
