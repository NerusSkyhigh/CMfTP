#include <math.h>

#define e2 14.395

/*
 *  Rutherford differential Cross-Section
 *    it computes the differential cross section
 *    in [?] units.
 *      double theta: scattering angle
 *          double E: Energy of the incoming beam
 *             int Z: atomic number of the target

 *  NOTE: The eneergy of the beam is assumed to be
 *        much larger than e^2*Z^2/(2*a0) where
 *        a0 = hbar^2/(m*e^2)
 */
double rutherford_dcs(double theta, double E, int Z)
{
  double alpha, dcs;

  // Screnning parameter
  alpha = 6.8*pow(Z, 2./3.) / E;

  // Differential Cross Section
  dcs = Z*Z*e2*e2/(4.*E*E) * pow(1-cos(theta)+alpha, -2.);

  return dcs;
}
