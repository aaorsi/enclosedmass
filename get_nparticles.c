#include <stdlib.h>
#include <stdio.h>
#include <hdf5.h>
#include <hdf5_hl.h>

#define MAXLEN 500

int get_nparticles(char * fname)
{
  
  /* Open the file */
  hid_t file_id = H5Fopen(fname, H5F_ACC_RDONLY, H5P_DEFAULT);
  if(file_id < 0)
    {
      printf("Unable to open file!\n");
      exit(1);
    }

  /* Get number of particles in this file */
  unsigned int npfile[6];
  if(H5LTget_attribute_uint(file_id, "Header", "NumPart_ThisFile", npfile) < 0)
    {
      printf("Failed to read number of particles!\n");
      exit(1);
    }
 
  return(npfile[1]);
 
}
