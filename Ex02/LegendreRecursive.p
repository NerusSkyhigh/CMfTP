# Using recursion relations, numerically calculate and
# represent the first six Legendre polynomials Pl(cos x)

# Analytical expressions
# Recursion relation:
#     (l+1) P(l+1, u) + l P(l-1, u) = (2l+1)u P(l, u)
#
# with u=cos(theta)
#
# -> P(l+1, u) = [(2l+1)u P(l, u) - l P(l-1, u) ]/(l+1)

p0(u) = 1.
p1(u) = u
p2(u) = (3*u*p1(u)-1*p0(u))/2
p3(u) = (5*u*p2(u)-2*p1(u))/3
p4(u) = (7*u*p3(u) - 3*p2(u))/4

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
