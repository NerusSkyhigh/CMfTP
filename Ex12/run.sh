#!/bin/bash
set -e

gcc -Wall Main.c RutherfordCrossSection.c -o Main.o -lm
mkdir -p data

# Z=79 for gold
./Main.o -E 1000 -Z 79 -s 1e-5 -e 180 -h 1e-2 -o "data/RutherfordCrossSection.csv"

gnuplot RutherfordCrossSection.p
