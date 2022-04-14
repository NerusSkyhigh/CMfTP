set terminal wxt size 600,700
set multiplot layout 5, 1 rowsfirst

#################
## WINDOW PLOT ##
#################
set xrange [0:90]
set yrange [-1e-6:1e-6]

set xlabel '{/Symbol q} (deg)'
set ylabel '{/Symbol D}'

set grid

plot 'data/ldiff-n0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1

pause -1 "Hit return to continue"



##############
## PNG PLOT ##
##############
unset multiplot

set terminal png size 600,700
set output 'comparison.png'

set multiplot layout 5, 1 rowsfirst

set xrange [0:90]
set yrange [-1e-6:1e-6]

set xlabel '{/Symbol q} (deg)'
set ylabel '{/Symbol D}'

set grid

plot 'data/ldiff-n0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1
plot 'data/ldiff-n4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1
