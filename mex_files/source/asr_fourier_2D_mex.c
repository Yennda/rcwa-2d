#include "mex.h"
#include "math.h"

/*
Author: Pavel Kwiecien, pavel.kwiecien@seznam.cz
Czech Technical University in Prage, Optical Physics Group, Czech Republic
*/

void DisplayMatrix(char *Name, double *Data, int M, int N)
{ /* Display matrix data */
  int m, n;
  mexPrintf("%s = \n", Name);
  for(m = 1; m < (M+1); m++, mexPrintf("\n"))
    for(n = 1; n < (N+1); n++)
      mexPrintf("%8.4f ", Data[(m-1) + M*(n-1)]);
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int r,s,n_x,n_y;
    double *results_r, *results_i;
    double *result_r, *result_i;
    int m,n,j,l;
    long index_s, index;
    int r_result,s_result,r_results,s_results;
    
    r=mxGetM(prhs[2]);
    s=mxGetN(prhs[2]);

    n_x=(int)(mxGetScalar(prhs[0]));
    n_y=(int)(mxGetScalar(prhs[1]));
    
    results_r = mxGetPr(prhs[2]);
    results_i = mxGetPi(prhs[2]);
    
    plhs[0] = mxCreateDoubleMatrix(n_x*n_y, n_x*n_y, mxCOMPLEX);

    result_r=mxGetPr(plhs[0]);
    result_i=mxGetPi(plhs[0]);
    
    for(m=0;m<n_x;m++){
        for(n=0;n<n_y;n++){
            for(j=0;j<n_x;j++){
                for(l=0;l<n_y;l++){
                    
                    r_result=m*n_y+n+1;
                    s_result=j*n_y+l+1;
                    
                    r_results=n_x+m-j;
                    s_results=n_y+n-l;
                    
                    index=((s_result-1)*n_x*n_y)+(r_result-1);
                    index_s=((s_results-1)*r)+(r_results-1);
                    
                    result_r[index]=results_r[index_s];
                    result_i[index]=results_i[index_s];
                                                
                }
            }
        }
    }
    
}
