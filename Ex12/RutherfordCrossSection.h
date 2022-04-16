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
double rutherford_dcs(double theta, double E, int Z);
