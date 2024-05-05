FILENAME = 23141808_2.pml
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

# run with `make one_ltl LTL=pX`
one_ltl: spin pan
	./pan -a -N $(LTL)

trail: spin pan one_ltl
	spin -t -p $(FILENAME).trail

clean:
	rm -f $(FILENAME).trail pan* _spin_nvr.tmp
