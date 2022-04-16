#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "RutherfordCrossSection.h"

int main(int argc, char *argv[])
{
  int Z = 0;
  double E = 1000; //eV
  double xi=0, xf=0, dx = 0;

  FILE *fptr = NULL;

  for (int i = 0; i < argc; i++) {
    /* Output file */
    if( (strcmp(argv[i], "-o") == 0)  &&  i+1<argc) {
      fptr = fopen(argv[i+1], "w");
    }

    /* Energy of the incoming beam */
    if( (strcmp(argv[i], "-E") == 0)  &&  i+1<argc) {
      E = atof(argv[i+1]);
    }

    /* Atomic number of the target */
    if( (strcmp(argv[i], "-Z") == 0)  &&  i+1<argc) {
      Z = atof(argv[i+1]);
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

  double dcs;
  if(fptr == NULL) {
    printf("File can't be opened.\n");
    return -1;
  }

  for(double x=xi; x<xf;  x+=dx) {
    dcs = rutherford_dcs(x*M_PI/180, E, Z);
    fprintf(fptr, "%f, %f\n", x, dcs);
  }

  fclose(fptr);
  return 0;
}
