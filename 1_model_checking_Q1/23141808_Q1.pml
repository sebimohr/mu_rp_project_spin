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

ltl p1 {[] (<>(b == true))}

ltl p2 {[](x >= 15)}

ltl p3 {<>(x == 15)}

ltl p4 {<>(x == 16)}

ltl p5 {<>([](x >= 16))}

ltl p6 {[] (<>(x == 16))}

ltl p7 {[] (b == false -> ([] (<> (x == 16))))}

