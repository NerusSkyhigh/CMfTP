###########################################------------------------------------#
## RUTHERFORD DIFFERENTIAL CROSS SECTION ##
###########################################
set terminal wxt size 700,500
set title "Screened Rutherford Differential Cross Section"
set xrange [0:180]
#set yrange [0.01:50]
set xlabel 'Scattering Angle [deg]'
set ylabel 'd{/Symbol s}/d{/Symbol W} [A^2/sr]'
set grid
set logscale y 10

plot 'data/RutherfordCrossSection.csv' title 'Au, 1000 eV' with linespoints lw 0.5 ps 0.1

pause -1 "Hit return to continue"

set terminal png size 700,500
set output 'RutherfordCrossSection.png'
replot
