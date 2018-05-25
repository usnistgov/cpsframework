% Step 2 -- to be used together with step1.lp
% A cyberattack occurs and hacks the SAM to switch 
% input device 1 to fast-mode.
%
% Outcome:
%   * the CPS no longer satisfies the interity concern
%     because its properties say that the basic camera cannot 
%     record at 30+ fps. Hence, the recording is thrown out
%     of court.
%
% Questions:
%   1. Is the functionality concern satisfied?
%   2. Is the functional aspect satisfied?
%   3. Are all aspects satisfied?
%   4. What happens in the environment?
% 
% Answers:
%   1. No (functionality is violated if the basic type of input
%          device 1 is operating in fast-mode with encrypted memory)
%   2. No (because functionality is violated)
%   3. No (because functional aspect is violated)
%   4. The recording is thrown out of court (because functional aspect
%      was violated)

% Knowledge of cyberattacks, effects, and ramifications
% This is outside of the scope of the CPS Model

step(1).

% a cyberattack
occurs(cyberattack,0).
fluent(affected(sam)).
obs(affected(sam),false).
holds(affected(sam),S2) :-
	step(S), step(S2), S2=S+1,
	occurs(cyberattack,S).
-holds("slow_mode_input1",S) :-
	step(S),
	holds(affected(sam),S).

% if input device 1 does not function properly, the recording is thrown out
event(recipient_rejects,S) :- last_step(S),-holds(sat_concern("cpsf:Functional"),S).
%%%%event_descr(recipient_rejects,"recording thrown out in court")

% ------ Output Interface ------

output(D,event,S) :- event(E,S),event_descr(E,D).
