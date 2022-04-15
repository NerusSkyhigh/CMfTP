#!/bin/bash
set -e

gcc -Wall BesselFunctions.c -o BesselFunctions.o -lm -I~$USER/gsl/include  -L~$USER/gsl/lib -lgsl -lgslcblas
mkdir -p data

for l in 0 1 2 3 4
do
	./BesselFunctions.o bf -l $l -s 1e-5 -e 20 -h 1e-2 > data/besselForwardComparison-l$l.csv

	./BesselFunctions.o b -l $l -s 1e-5 -e 20 -h 1e-2 > data/bessel-l$l.csv
	./BesselFunctions.o n -l $l -s 1e-5 -e 20 -h 1e-2 > data/neumann-l$l.csv

	./BesselFunctions.o bgsl -l $l -s 1e-5 -e 20 -h 1e-2 > data/besselComparison-l$l.csv
	./BesselFunctions.o ngsl -l $l -s 1e-5 -e 20 -h 1e-2 > data/neumannComparison-l$l.csv
done

gnuplot BesselFunctions.p
