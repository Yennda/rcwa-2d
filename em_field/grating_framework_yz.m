%{
clear all

addpath('/usr/home/m/kwiecien/Dropbox/Public/a_rcwa/arcwa_2d/structures')
addpath('/usr/home/m/kwiecien/Dropbox/Public/a_rcwa/arcwa_2d')

cd('/usr/home/m/kwiecien/Dropbox/Public/a_rcwa/arcwa_2d/structures');
input_file='photonic_wire_3D_S_matrix.m';

copyfile(input_file,'temporary.m')
temporary
delete('temporary.m')

optimalizace_vypoctu_vstup;
cd('/usr/home/m/kwiecien/Dropbox/Public/a_rcwa/arcwa_2d/em_field');
%---------------------------------------------------------
yz_slice_coordinate_x=1.2;
%}

% podle yz_slice_coordinate_x vybrat spravne eps
% !!! predpoklad, ze vsechny casti jsou rozdeleny podle stejnych souradnic

% na pozici lze pouzit jenom coordinate_united_x

eps_yz_slice_file;

%input + output region thickness
%thickness=[0 thickness 0];

eps_yz_slice=[eps_yz_slice(:,1)*0+n_1,eps_yz_slice,eps_yz_slice(:,1)*0+n_3];

total_thickness(1)=0;
for i=1:1:length(thickness)
    total_thickness(i+1)=total_thickness(i)+thickness(i);
end
total_thickness=[0 total_thickness total_thickness(end)];
%------------------------------------------------------------------------

size_eps=size(eps_yz_slice);

n_of_rows=size_eps(1);
n_of_columns=size_eps(2);

n_of_rows=size_eps(1);
n_of_columns=size_eps(2);

% backup coordinate_united_x, coordinate_united_y
coord_y=coordinate_united_y;

eps_yz_slice=rot90(eps_yz_slice,3);
coordinate_united_y=fliplr(coordinate_united_y);

size_eps=size(eps_yz_slice);

n_of_rows=size_eps(1);
n_of_columns=size_eps(2);

% yes boundary =1
% no boundary =0

matrix_geometry=zeros(n_of_rows,n_of_columns,4);

% left boundary
matrix_geometry(:,1,1)=2;

% top boundary
matrix_geometry(1,:,2)=2;

% right boundary
matrix_geometry(:,end,3)=2;

% bottom edge
matrix_geometry(end,:,4)=2;

Z=[-100,-100];

for i=1:1:n_of_rows
    for j=1:1:n_of_columns
        
        % left
        if j==1 % již vyřešeno
        else
            if eps_yz_slice(i,j)==eps_yz_slice(i,j-1)
                matrix_geometry(i,j,1)=2;
            else
                matrix_geometry(i,j,1)=1;
            end
            
        end
        
        % top
        if i==1 % již vyřešeno
        else
            if eps_yz_slice(i,j)==eps_yz_slice(i-1,j)
                matrix_geometry(i,j,2)=2;
            else
                matrix_geometry(i,j,2)=1;
            end
            
        end
        
        % right
        if j==n_of_columns % již vyřešeno
        else
            if eps_yz_slice(i,j)==eps_yz_slice(i,j+1)
                matrix_geometry(i,j,3)=2;
            else
                matrix_geometry(i,j,3)=1;
            end
            
        end
        
        % bottom
        if i==n_of_rows
        else
            if eps_yz_slice(i,j)==eps_yz_slice(i+1,j)
                matrix_geometry(i,j,4)=2;
            else
                matrix_geometry(i,j,4)=1;
            end
            
        end
        
        
    end
end

%figure;

for i=1:1:n_of_rows
    for j=1:1:n_of_columns
        % left
        
        if matrix_geometry(i,j,1)==2  %nic
        else
            x_1=coordinate_united_y(j);
            y_1=total_thickness(i);
            
            x_2=coordinate_united_y(j);
            y_2=total_thickness(i+1);
            
            X=[x_1,x_2];
            Y=[y_1,y_2];
            
            line(X,Y,Z,'Color',[1 1 1]);
            
        end
        
        % top
        
        if matrix_geometry(i,j,2)==2 %nic
        else
            
            x_1=coordinate_united_y(j);
            y_1=total_thickness(i);
            
            x_2=coordinate_united_y(j+1);
            y_2=total_thickness(i);
            
            X=[x_1,x_2];
            Y=[y_1,y_2];
            
            line(X,Y,Z,'Color',[1 1 1]);
            
        end
        
        
        % right
        
        if matrix_geometry(i,j,3)==2 %nic
        else
            x_1=coordinate_united_y(j+1);
            y_1=total_thickness(i);
            
            x_2=coordinate_united_y(j+1);
            y_2=total_thickness(i+1);
            
            X=[x_1,x_2];
            Y=[y_1,y_2];
            
            line(X,Y,Z,'Color',[1 1 1]);
            
        end
        
        
        % bottom
        
        if matrix_geometry(i,j,4)==2 %nic
        else
            
            x_1=coordinate_united_y(j+1);
            y_1=total_thickness(i+1);
            
            x_2=coordinate_united_y(j);
            y_2=total_thickness(i+1);
            
            X=[x_1,x_2];
            Y=[y_1,y_2];
            
            line(X,Y,Z,'Color',[1 1 1]);
            
            
        end
        
    end
end

coordinate_united_y=coord_y;