%S. A. H. Nekuee, A. Khavasi, and M. Akbari. "Fourier modal method formulation for fast analysis of two-dimensional periodic arrays of graphene." JOSA B 31, 987-993(2014
%http://ee.sharif.ir/~khavasi/index_files/Page1077.htm

function [OutputI OutputII]=PLI2DGraphene(r,d1,d2,Sigmaa,Sigmab,M,N,zet) 
%% this part is written base numerical integration in the X1OX2 coordinate
%% which is correcter than numerical integration in the XOY coordinate because zeta isn't equal to zero; 
%% First Inverse rule and then Laurent rule
%% OutputI  : inverse in x1 and the Laurent in x2 direction
%% OutputII : inverse in x2 and the Laurent in x1 direction

a=r;
b=a;
q=sqrt(-1);    

num=500;         % # of points in numerical integration

A1=Sigmab*eye(2*N+1);

step=(2*r/cos(zet))/num;
x2=(-r/cos(zet)):step:(r/cos(zet));
% because a=b and M=N, we don't need to calculate A2 twice, therefore we save A2s in the X matrix
X=zeros(2*M+1,(num+1)*(2*M+1));  
% numerical integration in the x direction, X is given, in each x we should calculate A Matrix
for p=1:(num+1) 
    x10p=-x2(p)*sin(zet)+sqrt(-(x2(p)*cos(zet))^2+r^2);
    x10n=-x2(p)*sin(zet)-sqrt(-(x2(p)*cos(zet))^2+r^2);
    A2=FC1DP(x10n,x10p,d1,Sigmaa,Sigmab,M);
    X(:,((p-1)*(2*M+1)+1):((p)*(2*M+1)))=A2;
    clear A2 x10p x10n
end
kodd=2:2:num;
keven=3:2:num;
fy=zeros(1,num+1);
OutputI=zeros((2*M+1)*(2*N+1),(2*M+1)*(2*N+1));
k=0;
for m=-M:M
    for n=-N:N
        k=k+1;
        h=0;
        for j=-M:M
            for l=-N:N
                h=h+1;
                fy(1:(num+1))=X(m+M+1,(0:num).*(2*M+1)+j+M+1).*exp(-q*(n-l)*2*pi*x2(1:(num+1))/d2);
                %INTf is the integral in the y dorection from -b upto b
                INTf=(step/3)*(fy(1)+fy(num+1)+4*sum(fy(kodd))+2*sum(fy(keven)));
                if n==l
                    OutputI(k,h)=A1(m+M+1,j+M+1)*((-b/cos(zet))-(-d2/2))/d2+...
                                 A1(m+M+1,j+M+1)*((d2/2)-(b/cos(zet)))/d2+...
                                 INTf/d2; 
                else
                    OutputI(k,h)=A1(m+M+1,j+M+1)*(exp(-q*2*pi*(n-l)*(-b/cos(zet))/d2)-exp(-q*2*pi*(n-l)*(-d2/2)/d2))/(-q*2*pi*(n-l))+...
                                 A1(m+M+1,j+M+1)*(exp(-q*2*pi*(n-l)*(d2/2)/d2)-exp(-q*2*pi*(n-l)*(b/cos(zet))/d2))/(-q*2*pi*(n-l))+...
                                 INTf/d2;
                end
            end
        end
    end
end




step=(2*r/cos(zet))/num;
x1=(-r/cos(zet)):step:(r/cos(zet));
if d1~=d2 && M~=N
    clear X;
    X=zeros(2*N+1,(num+1)*(2*N+1));
    for p=1:(num+1) % numerical integration in the x direction, X is given, in each x we should calculate A Matrix
        x20p=-x1(p)*sin(zet)+sqrt(-(x1(p)*cos(zet))^2+r^2);
        x20n=-x1(p)*sin(zet)-sqrt(-(x1(p)*cos(zet))^2+r^2);
        A2=FC1DP(x20n,x20p,d2,Sigmaa,Sigmab,N);
        X(:,((p-1)*(2*N+1)+1):((p)*(2*N+1)))=A2;
    end
end
OutputII=zeros((2*M+1)*(2*N+1),(2*M+1)*(2*N+1));
kodd=2:2:num;
keven=3:2:num;
fx=zeros(1,num+1);
k=0;
for m=-M:M
    for n=-N:N
        k=k+1;
        h=0;
        for j=-M:M
            for l=-N:N
                h=h+1;
                % the integrand (fx) in diffrent points from -a upto a
                fx(1:(num+1))=X(n+N+1,(0:num).*(2*N+1)+l+N+1).*exp(-q*(m-j)*2*pi*x1(1:(num+1))/d1); 
                %INTf is the integral in the x direction from -a up a
                INTf=(step/3)*(fx(1)+fx(num+1)+4*sum(fx(kodd))+2*sum(fx(keven)));
                if m==j
                    OutputII(k,h)=A1(n+N+1,l+N+1)*((-a/cos(zet))-(-d1/2))/d1+...
                                  A1(n+N+1,l+N+1)*((d1/2)-(a/cos(zet)))/d1+...
                                  INTf/d1; 
                else
                    OutputII(k,h)=A1(n+N+1,l+N+1)*(exp(-q*2*pi*(m-j)*(-a/cos(zet))/d1)-exp(-q*2*pi*(m-j)*(-d1/2)/d1))/(-q*2*pi*(m-j))+...
                                  A1(n+N+1,l+N+1)*(exp(-q*2*pi*(m-j)*(d1/2)/d1)-exp(-q*2*pi*(m-j)*(a/cos(zet))/d1))/(-q*2*pi*(m-j))+...
                                  INTf/d1;
                end
            end
        end
    end
end


function Output=FC1DP(x10n,x10p,d1,Sigmaa,Sigmab,M) 
%% Toeplitz matrix for 1D periodic structure in the x1 direction or in the x2 direction
q=sqrt(-1);
Epsi=zeros(4*M+1,1);
for m=-2*M:2*M
    if m==0 
       CF=((x10n-(-d1/2))/Sigmab+(x10p-x10n)/Sigmaa+(d1/2-x10p)/Sigmab)/d1;
       Epsi(m+2*M+1)=CF;
    else
       CF=(1/Sigmab)*(exp(-q*2*pi*(m)*(x10n)/d1)-exp(-q*2*pi*(m)*(-d1/2)/d1))/(-q*2*pi*(m))+...
          (1/Sigmaa)*(exp(-q*2*pi*(m)*(x10p)/d1)-exp(-q*2*pi*(m)*(x10n)/d1))/(-q*2*pi*(m))+...
          (1/Sigmab)*(exp(-q*2*pi*(m)*(d1/2)/d1)-exp(-q*2*pi*(m)*(x10p)/d1))/(-q*2*pi*(m));
       Epsi(m+2*M+1)=CF;
    end
end
Output1=toeplitz(Epsi(2*M+1:4*M+1),Epsi(2*M+1:-1:1));
Output=inv(Output1);