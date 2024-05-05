/*
Sebastian Mohr - 23141808
Question 1
*/

byte x = 0;
bool b = false;

active proctype P () 
{
    do
        :: x < 20 -> x = 20; b = true
        :: x >= 0 -> if
                    :: x < 30 -> x++
                    :: else -> x = 15
                    fi
    od
}

// p1 should hold
ltl p1 {<>(b == true)}

// p2 should not hold
ltl p2 {[](x >= 15)}

// p3 should hold
ltl p3 {<>(x == 15)}

// p4 should hold
ltl p4 {<>(x == 16)}

// p5 should not hold
ltl p5 {<>([](x >= 16))}

// p6 should hold
ltl p6 {[] (<>(x == 16))}

// p7 should hold
ltl p7 {[] (b == false -> ([] (<> (x == 16))))}

