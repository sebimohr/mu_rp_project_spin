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

// p1 should not hold
ltl p1 {[](count < 30)}

// p2 should hold
ltl p2 {count > 0 -> ((count > 0 U (mode > 1)) && <> (mode > 1))}

// p3 should hold
ltl p3 {count > 0 -> <> (count == 0)}

// p4 should hold
ltl p4 {<>(mode == 3)}
