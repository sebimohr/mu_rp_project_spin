/*
Sebastian Mohr - 23141808
Question 1

NOTE: The explanations to the ltls are in a seperate pdf document: 23141808_1.pdf
I really put much effort into the pdf and read afterwards that the explanations should be in the .pml file.
As I didn't want all of my work to go to waste I let it stay in the pdf... :)
For the second question I worked as requested, I hope that's fine.

To run this code:
	spin -a 23141808_1.pml
	gcc -o pan pan.c
	./pan -a -N p1
	./pan -a -N p2
	./pan -a -N p3
	./pan -a -N p4
	./pan -a -N p5
	./pan -a -N p6
	./pan -a -N p7
*/

// ------------------------------------------------------------------------------------------
// GIVEN CODE
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
// ------------------------------------------------------------------------------------------

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

