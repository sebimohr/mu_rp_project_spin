/*
Sebastian Mohr - 23141808
Question 2
*/

byte mode = 1;
byte count = 0;

active proctype m ()
{
    endLoop:
        if
            :: mode = 1
            :: mode = 2
        fi;
        do
            :: mode == 1 && count < 30 -> count++
            :: mode == 2 -> count = 0; goto endLoop
            :: mode == 3 -> break
            :: else -> goto endLoop
        od;
        count = 0
}

active proctype n ()
{
    do
        :: mode = 3
    od
}

/**
P1 should not hold:
- count increases until 31 when mode == 1.
 */
ltl p1 {[](count < 30)}

/**
P2 should hold:
- the only way count will be decreased to 0 is when mode is 2 or 3 and therefore greater than 1.
 */
ltl p2 {count > 0 -> ((count > 0 U (mode > 1)) && <> (mode > 1))}

/**
P3 should hold:
- count will be greater than 0 until mode is 2 or the program ends with mode = 3, which sets count to 0.
 */
ltl p3 {count > 0 -> <> (count == 0)}

/**
P4 should hold:
- when n gets executed mode is set to 3 and the program terminates.
 */
ltl p4 {<>(mode == 3)}

/** Q2 - b
Weak-Fairness assures that the program eventually reaches every action.

When Weak-Fairness is no longer assumed, it means that mode could always stay in state 1.
That would break p2, p3 and p4, as they all require mode to be changed to 2 or 3 at some point,
because otherwise their respective assertions won't happen or become true.
 */
