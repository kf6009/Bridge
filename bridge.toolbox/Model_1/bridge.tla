------------------------------- MODULE bridge -------------------------------
EXTENDS Naturals, Sequences 
CONSTANT Cars, Capacity

VARIABLE bridge

Init == bridge = <<>>

Type == bridge \in Seq(Cars)

Safe == Len(bridge) \leq Capacity
--------
(* Test to see if a value is in a sequence *)
IsOnBridge(a) == \E n \in DOMAIN bridge : bridge[n] = a 

enter(c) == 
     /\ c \in Cars
     /\ \lnot IsOnBridge(c)
     /\ Len(bridge)<Capacity
     /\ bridge' = Append(bridge, c)
exit == 
    /\ Len(bridge) > 0
    /\ bridge' = Tail(bridge)
--------
Next ==
    \/ \E c \in Cars : enter(c)
    \/ exit
=============================================================================
\* Modification History
\* Last modified Fri Feb 12 20:31:31 GMT 2021 by alunm
\* Created Thu Feb 11 10:48:41 GMT 2021 by alunm
