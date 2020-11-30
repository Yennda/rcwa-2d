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
  int mMAX,nMAX,aMAX, a1, a2, n1, n2, m1, m2, m, n, size;
  long i_r, i_o, index_i, index_o;
  double *fMpp_r, *fMpp_i, *fMmp_r, *fMmp_i, *fMpm_r, *fMpm_i, *fMmm_r, *fMmm_i;
  double *fM_r, *fM_i;
  int div_t, divresult;

    mMAX=(int)(mxGetScalar(prhs[0]));
    nMAX=(int)(mxGetScalar(prhs[1]));
    aMAX=(int)(mxGetScalar(prhs[2]));
    
    fMpp_r = mxGetPr(prhs[3]);
    fMpp_i = mxGetPi(prhs[3]);
    
    size=mxGetM(prhs[3]);
    
    fMmp_r = mxGetPr(prhs[4]);
    fMmp_i = mxGetPi(prhs[4]);
    
    fMpm_r = mxGetPr(prhs[5]);
    fMpm_i = mxGetPi(prhs[5]);
    
    fMmm_r = mxGetPr(prhs[6]);
    fMmm_i = mxGetPi(prhs[6]);
    
    plhs[0] = mxCreateDoubleMatrix(aMAX, aMAX, mxCOMPLEX);

    fM_r=mxGetPr(plhs[0]);
    fM_i=mxGetPi(plhs[0]);
    
    for (a1=1;a1<(aMAX+1);a1++){
      for (a2=1;a2<(aMAX+1);a2++){
	
	n1=floor((a1-1)/(2*mMAX+1)) - nMAX;
	m1=(a1-1)%(2*mMAX+1) - mMAX;
	
	n2=floor((a2-1)/(2*mMAX+1)) - nMAX;
	m2=(a2-1)%(2*mMAX+1) - mMAX;
	
	m=(m2-m1);
	n=(n2-n1);
	
    index_o=(a1-1) + aMAX*(a2-1);
    
	if(m>=0 && n>=0){
        index_i=m+size*n;
	  fM_r[index_o]=fMpp_r[index_i];
	  fM_i[index_o]=fMpp_i[index_i];
	}
	else if(m<0 && n>=0){
        index_i=-m+size*n;
	  fM_r[index_o]=fMmp_r[index_i];
	  fM_i[index_o]=fMmp_i[index_i];
	}
	else if(m>=0 && n<0){
        index_i=m-size*n;
	  fM_r[index_o]=fMpm_r[index_i];
	  fM_i[index_o]=fMpm_i[index_i];
	}
	else{
        index_i=-m-size*n;
	  fM_r[index_o]=fMmm_r[index_i];
	  fM_i[index_o]=fMmm_i[index_i];
	}
	
	
      }
    }
    
}
