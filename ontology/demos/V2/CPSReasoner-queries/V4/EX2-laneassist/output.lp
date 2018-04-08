% ------ Output Interface ------

descr("using_basic_input1","Basic camera is in use").
event_descr(recipient_rejects,"automated navigation shuts off").
action_descr(patch(sam),"patch the SAM").

event(recipient_rejects2,S) :- last_step(S),event(recipient_rejects,S).
event_descr(recipient_rejects2,"car shuts off").
