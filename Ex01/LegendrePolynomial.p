# Use gnuplot for calculating the first Legendre polynomials and to graphically represent them.

# Analytical expressions
p0(u) = 1.
p1(u) = u
p2(u) = 0.5*(3.*u*u-1.)
p3(u) = 0.5*(5.*u*u*u-3.*u)
p4(u) = 0.125*(35.*u*u*u*u-30.*u*u+3.)

theta(x) = pi*x/180
u(theta) = cos(theta)

set xrange [0:90]
set yrange [-1.:1.5]
set grid

set xlabel '{/Symbol q} (deg)'
set ylabel 'P_l(cos {/Symbol q})'

plot p0(u(theta(x))) title 'P_0', \
      p1(u(theta(x))) title 'P_1', \
      p2(u(theta(x))) title 'P_2', \
      p3(u(theta(x))) title 'P_3', \
      p4(u(theta(x))) title 'P_4'


pause -1
