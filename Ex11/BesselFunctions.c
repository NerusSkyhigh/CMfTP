#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#include <gsl/gsl_sf_bessel.h>

#define EPSILON 9.9999e-300
#define BL_UPPER_LIMIT 230
/*
 *  Bessel functions
 *  To improve precision it is necessary to
 *  perform backwards steps.
 */

double Bessel(int l, double x)
{
  double bessel_next = 0; // Bessel l+2
  double bessel_curr = EPSILON; // Bessel l+1
  double bessel_prev; // Bessel l

  double y;
  for(int li=BL_UPPER_LIMIT; li>=0; li--) // l index
  {
    if(l==0 && x==0) {
      bessel_curr = 1;
    } else if(l>0 && x==0) {
      bessel_curr = 0;
    } else {
      bessel_prev = (2*li+3)*bessel_curr/x - bessel_next;
    }

    if(li == l) {
      y = bessel_prev;
    }

    bessel_next = bessel_curr;
    bessel_curr = bessel_prev;
  }

  // At this point both bessel(l, x) and bessel(0, x) are available
  // but they are not normalized because the value EPSILON is arbitrary.
  // It is possible to use the known form of bessel(0, x)=bessel_curr to
  // normalize bessel(l, x) to the correct value.
  double normalisation_factor = (sin(x)/x)/bessel_curr;

  return y*normalisation_factor;
}


/*
 * Bessel evaluated with the forward procedure
 *    it is posible to improve the precision with a
 *    backward procedure
 */
double BesselForward(int l, double x)
{
  switch(l)
  {
    case 0:
      return sin(x)/x;
      break;

    case 1:
      return sin(x)/(x*x)-cos(x)/x;
      break;

    default:
      return (2*-1)*Bessel(l-1, x)/x - Bessel(l-2, x);
      break;
  }
}

double Neumann(int l, double x)
{
  // Recursive procedure
  switch(l)
  {
    case 0:
      return -1*cos(x)/x;
      break;

    case 1:
      return -1*cos(x)/(x*x)-sin(x)/x;
      break;

    default:
      return (2*l-1)*Neumann(l-1, x)/x - Neumann(l-2, x);
      break;

  }
}


int main(int argc, char *argv[])
{
  int FUNC = 0, l=0;
  double xi=0, xf=0, dx = 0;

  for (int i = 0; i < argc; i++) {
    /* Function type */
    if( strcmp(argv[i], "bf")==0 ) {    // +3 => Bessel forward Comparison
      FUNC = +3;
    }
    if( strcmp(argv[i], "b")==0 ) {     // +1 => Bessel
      FUNC = +1;
    }
    if( strcmp(argv[i], "n")==0 ) {     // -1 => Neumann
      FUNC = -1;
    }
    if( strcmp(argv[i], "bgsl")==0 ) {  // +2 => Bessel GSL comparison
      FUNC = +2;
    }
    if( strcmp(argv[i], "ngsl")==0 ) {  // -2 => Neumann GSL comparion
      FUNC = -2;
    }

    /* Angular number l */
    if( (strcmp(argv[i], "-l") == 0)  &&  i+1<argc) {
      l = atoi(argv[i+1]);
    }

    /*Mesh size and spacing */
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

  double y;
  for(double x=xi; x<xf;  x+=dx) {

    switch(FUNC) {
      case +3:
        y = Bessel(l, x) - BesselForward(l, x);
        break;

      case +2:
        y = Bessel(l, x) - gsl_sf_bessel_jl(l, x);
        break;

      case +1:
        y = Bessel(l, x);
        break;

      case -1:
        y = Neumann(l ,x);
        break;

      case -2:
        y = Neumann(l ,x) - gsl_sf_bessel_yl(l, x);
        break;

      default:
        printf("Default?");
        y = 0;
    }

    printf("%f, %f\n", x, y);
  }

  return 0;
}
