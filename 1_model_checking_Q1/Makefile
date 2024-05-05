FILENAME = 23141808_Q1.pml
LTL = p1

all: spin pan run_all

spin:
	spin -a $(FILENAME)

pan: pan.c
	gcc -o pan pan.c

run_all: pan
	./pan -N p1
	./pan -N p2
	./pan -N p3
	./pan -N p4
	./pan -N p5
	./pan -N p6
	./pan -N p7

# run with `make one_ltl LTL=pX`
one_ltl: spin pan
	./pan -a -N $(LTL)

trail: spin pan one_ltl
	spin -t -p $(FILENAME).trail
