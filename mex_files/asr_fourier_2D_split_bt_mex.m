% Author: Pavel Kwiecien, pavel.kwiecien@seznam.cz
% Czech Technical University in Prage, Optical Physics Group, Czech Republic

function result=asr_fourier_2D_split_bt_mex(M,N,result,inv_f_toep,fourier_1D_v)


for m=-M:1:M    
    for n=-N:1:N            
        i1=(n+N+1)+(m+M)*(2*N+1);            
        for j=-M:1:M                
            for l=-N:1:N                    
                i2=(l+N+1)+(j+M)*(2*N+1);                    
                result(i1,i2)=result(i1,i2)+fourier_1D_v(n-l+2*N+1)*inv_f_toep(m+M+1,j+M+1);                
            end            
        end        
    end    
end