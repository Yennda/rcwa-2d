%S. A. H. Nekuee, A. Khavasi, and M. Akbari. "Fourier modal method formulation for fast analysis of two-dimensional periodic arrays of graphene." JOSA B 31, 987-993(2014
%http://ee.sharif.ir/~khavasi/index_files/Page1077.htm

function Output=PFC2DGraphene(r,d1,d2,epsilona,epsilonb,M,N,zet)  
%% Pillar Fourier coefficients
%% This part computes the Mcoeff using bessel functions.
%% 2D Toeplitz Matrix for Pillar grating [[e]] and [[1/e]] 

X=zeros((2*N+1),(4*M+1)*(2*N+1));
for m=-2*M:2*M
    X(:,((m+2*M)*(2*N+1)+1):((m+2*M+1)*(2*N+1)))=FC2Dp(m,r,d1,d2,epsilona,epsilonb,N,zet);
end
Output=zeros((2*M+1)*(2*N+1));
for m=-M:M
    for j=-M:M
        Output(((m+M)*(2*N+1)+1):((m+M+1)*(2*N+1)),((j+M)*(2*N+1)+1):((j+M+1)*(2*N+1)))=X(:,(((m-j)+2*M)*(2*N+1)+1):(((m-j)+2*M+1)*(2*N+1)));
    end
end 


function Output=FC2Dp(m,r,d1,d2,epsilona,epsilonb,N,zet) 
%% Toeplitz matrix for 1D periodic structure in the x1 direction or in the x2 direction
Epsi=zeros(4*N+1,1);
for n=-2*N:2*N
    if m==0 && n==0
        CF=epsilonb+sec(zet)*(epsilona-epsilonb)*pi*r*r/d1/d2;
        Epsi(n+2*N+1)=CF;
    else
        XX=sqrt((m*r/d1)^2+(m*r*tan(zet)/d1-n*r*sec(zet)/d2)^2);
        CF=0+sec(zet)*(epsilona-epsilonb)*besselj(1,2*pi*XX)*r*r/XX/d1/d2;
        Epsi(n+2*N+1)=CF;
    end
end
Output=toeplitz(Epsi(2*N+1:4*N+1),Epsi(2*N+1:-1:1));