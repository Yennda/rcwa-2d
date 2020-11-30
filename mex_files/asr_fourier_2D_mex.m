% Author: Pavel Kwiecien, pavel.kwiecien@seznam.cz
% Czech Technical University in Prage, Optical Physics Group, Czech Republic

function result=asr_fourier_2D_mex(n_x,n_y,results)

result=zeros(n_x*n_y,n_x*n_y);

for m=0:1:(n_x-1)
    for n=0:1:(n_y-1) 
        for j=0:1:(n_x-1)
            for l=0:1:(n_y-1)
                result(m*n_y+n+1,j*n_y+l+1)=results(n_x+m-j,n_y+n-l);
            end
        end
    end
end