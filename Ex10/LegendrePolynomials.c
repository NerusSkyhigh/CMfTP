#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#include <gsl/gsl_sf_legendre.h>
/*
 * Legendre Polynomial
 */
double LegendrePolynomial(int n, double x)
{
  // Recursive procedure
  switch(n)
  {
    case 0:
      return 1;
      break;

    case 1:
      return x;
      break;

    default:
      return ((2*n-1)*x*LegendrePolynomial(n-1, x)
                - (n-1)*LegendrePolynomial(n-2, x))/n;
      break;
  }
}



int main(int argc, char *argv[])
{
  int n=0;
  double xi=0, xf=0, dx = 0;
  int compare = 0;

  for (int i = 0; i < argc; i++) {
    /*
     * Angular number l
     */
    if( (strcmp(argv[i], "-n") == 0)  &&  i+1<argc) {
      n = atoi(argv[i+1]);
    }

    if(strcmp(argv[i], "-compare") == 0) {
      compare = 1;
    }

    /*
     * Mesh size and spacing
     */
    if( (strcmp(argv[i], "-s") == 0)  &&  i+1<argc) {
      xi = atof(argv[i+1]); // x initial
    }

    if( (strcmp(argv[i], "-e") == 0)  &&  i+1<argc) {
      xf = atof(argv[i+1]); // x final
    }

    if( (strcmp(argv[i], "-h")==0)  &&  i+1<argc) {
      dx = atof(argv[i+1]); // spacing
    }

  }

  double y, theta, u, diff;

  for(double x=xi; x<xf;  x+=dx) {

    theta = M_PI*x/180;
    u = cos(theta);
    y = LegendrePolynomial(n, u);

    if(compare) {
      diff = y-gsl_sf_legendre_Pl(n, u);
      printf("%f, %f\n", x, diff);
    } else {
      printf("%f, %f\n", x, y);
    }
  }

  return 0;
}
