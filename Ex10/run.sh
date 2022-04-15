#!/bin/bash
set -e

gcc -Wall LegendrePolynomials.c -o LegendrePolynomials.o -lm -I~$USER/gsl/include  -L~$USER/gsl/lib -lgsl -lgslcblas
mkdir -p data

for n in 0 1 2 3 4
do
	./LegendrePolynomials.o -n $n -s 0 -e 90 -h 1 > data/legendre-n$n.csv
done

gnuplot LegendreFunctions.p
