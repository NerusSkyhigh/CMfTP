set terminal wxt size 600,600

########################
## LEGENDRE FUNCTIONS ##
########################
set title "Legendre Functions"
set xrange [0:90]
set yrange [-1:1.5]

set xlabel '{/Symbol q} (deg)'
set ylabel 'l=l(cos {/Symbol q})'

set grid

plot 'data/legendre-n0.csv' title 'l=0' with linespoints lw 0.5 ps 0.1, \
			'data/legendre-n1.csv' title 'l=1' with linespoints lw 0.5 ps 0.1, \
			'data/legendre-n2.csv' title 'l=2' with linespoints lw 0.5 ps 0.1, \
			'data/legendre-n3.csv' title 'l=3' with linespoints lw 0.5 ps 0.1, \
			'data/legendre-n4.csv' title 'l=4' with linespoints lw 0.5 ps 0.1

pause -1 "Hit return to continue"

set terminal png size 600,600
set output 'LegendrePolynomials.png'
replot
