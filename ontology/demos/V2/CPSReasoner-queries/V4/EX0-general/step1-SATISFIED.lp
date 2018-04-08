% ======== SIMPLE EXAMPLE 1 ========
%       -- to be used together with theory*.lp
% SYSTEM DESCRIPTION
% Input device 1 can operate in one of slow-mode and fast-mode.
% The SAM determines the mode of operation of input device 1.
% Normally, input device 1 reads inputs with a consistent frequency.
% If the basic type of input device 1 is configured to use
% encrypted memory and fast-mode, then the device will be
% unable to maintain a consistent frequency of reading.
%
% CONFIGURATION
% The SAM and input device 1 are configured to use encrypted 
% memory and secure boot. 
% The basic type of input device 1 is used.
% The SAM is configured to set input device 1 to slow-mode.
%
% Questions:
%   1. Is the functionality concern satisfied?
%   2. Is the functional aspect satisfied?
%   3. Are all aspects satisfied?
% 
% Answers:
%   1. Yes
%   2. Yes (because all concerns and sub-concerns of functional aspect are satisfied)
%   3. Yes (because all aspects are satisfied)

% ------ Initial state of the CPS ------

% Properties
% ---Observations
obs("encrypted_mem_input1",true).
obs("encrypted_mem_sam",true).
obs("sec_boot_input1",true).
obs("sec_boot_sam",true).
obs("slow_mode_input1",true).

% Extra-framework configuration
config_feature("using_basic_input1").
%%%%descr("using_basic_input1","Basic type of input device 1 is in use").
% the basic type of input device 1 is used, unless we decide otherwise
%assumed("using_basic_input1",true).
obs("using_basic_input1",true).

step(0).

% ------ Constraints ------

%   Normally, input device 1 reads inputs with a consistent frequency.
defined(neg,"consist_reading_freq_input1").
%assumed("consist_reading_freq_input1",true).

%   An exception to this general rule is that, when the basic type 
%   of input 1 device is in use, using encrypted memory and 
%   fast mode impacts negatively the maintainability of a consistent 
%   reading frequency"
impacted(neg,"consist_reading_freq_input1",S) :-
	step(S),
	holds("using_basic_input1",S),
	holds("encrypted_mem_input1",S),
	-holds("slow_mode_input1",S).


% ------ Output Interface ------

output(D,property,S) :- last_step(S), holds(sat_property(A),S), atomic_statement(P,A), descr(P,D).
output(C,concern,S) :- last_step(S), holds(sat_concern(C),S),-aspect(C).
output(C,aspect,S) :- last_step(S), holds(sat_concern(C),S),aspect(C).
output("concern-tree",tree,S) :- last_step(S), holds(sat_all,S).

output_headings("satisfied concern/aspect/property","type","step").
