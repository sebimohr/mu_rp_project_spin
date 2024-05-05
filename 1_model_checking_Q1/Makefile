FILENAME = 23141808_Q1.pml

all: spin pan run

spin:
	spin -a $(FILENAME)

pan: pan.c
	gcc -o pan pan.c

run: pan
	./pan -a -N p1
	./pan -a -N p2
	./pan -a -N p3
	./pan -a -N p4
	./pan -a -N p5
	./pan -a -N p6
	./pan -a -N p7
