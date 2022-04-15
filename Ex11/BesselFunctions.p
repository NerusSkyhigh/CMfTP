######################---------------------------------------------------------#
## BESSEL FUNCTIONS ##
######################
set terminal wxt size 600,600
set title "Bessel"
set xrange [0:20]
set yrange [-0.5:1]
set xlabel 'x'
set ylabel 'j_l(x)'
set grid

plot 'data/bessel-l0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1, \
			'data/bessel-l1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1, \
			'data/bessel-l2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1, \
			'data/bessel-l3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1, \
			'data/bessel-l4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1

pause -1 "Hit return to continue"

set terminal png size 600,600
set output 'BesselFunctions.png'
replot


#######################--------------------------------------------------------#
## NEUMANN FUNCTIONS ##
#######################
set terminal wxt size 600,600
set title "Neumann"
set xrange [0:20]
set yrange [-0.4:0.4]
set xlabel 'x'
set ylabel 'n_l(x)'

set grid

plot 'data/neumann-l0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1, \
			'data/neumann-l1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1, \
			'data/neumann-l2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1, \
			'data/neumann-l3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1, \
			'data/neumann-l4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1

pause -1 "Hit return to continue"

set terminal png size 600,600
set output 'NeumannFunctions.png'
replot

unset title



########################################---------------------------------------#
## BESSEL FORWARD AND  GSL COMPARISON ##
########################################
unset multiplot

set terminal png size 900,1500
set output 'comparison.png'

set multiplot layout 5, 3 columnsfirst

set xrange [0:20]
#set yrange [-0.5:1]
#set xlabel 'x'
set ylabel '{/Symbol D}j_l(x)'
set grid

set title "Bessel - Bessel Forward"
plot 'data/besselForwardComparison-l0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1
unset title
plot 'data/besselForwardComparison-l1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1
plot 'data/besselForwardComparison-l2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1
plot 'data/besselForwardComparison-l3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1
plot 'data/besselForwardComparison-l4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1

set yrange [-1e-6:1e-6]
set title "Bessel - Bessel GSL"
plot 'data/besselComparison-l0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1
unset title
plot 'data/besselComparison-l1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1
plot 'data/besselComparison-l2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1
plot 'data/besselComparison-l3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1
plot 'data/besselComparison-l4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1


set ylabel '{/Symbol D}n_l(x)'
set title "Neumann - Neumann GSL"
plot 'data/neumannComparison-l0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1
unset title
plot 'data/neumannComparison-l1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1
plot 'data/neumannComparison-l2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1
plot 'data/neumannComparison-l3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1
plot 'data/neumannComparison-l4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1
