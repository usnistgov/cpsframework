% ------ Output Interface ------

descr("using_basic_input1","The interpolating sensor array is in use").
event_descr(recipient_rejects,"accelerator control shuts off").
action_descr(patch(sam),"patch the SAM").

event(recipient_rejects2,S) :- last_step(S),event(recipient_rejects,S).
event_descr(recipient_rejects2,"brake control shuts off").
