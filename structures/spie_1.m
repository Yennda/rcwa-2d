number_of_layers=2; % this parameter defines number of layers
mu=1;

Lambda_x=0.55;
h_gold=0.05;
d_gold=0.08;

%Lambda_x=0.55; %  [um]
Lambda_y=Lambda_x; %  [um]

resolution_dx=512; 

%d_gold=0.08;
%h_gold=0.05;

h_cytop=1;
r_gold=d_gold/2;

n_cylinder=gold; % refractive index of the cylinder
n_layer=1.33; % refractive index of the surrounding layer

%theta0=61.8; % incident angle [degree], if theta=0 -> theta0+1E-10
phi0=0;%45; % conical angle [degree]
if phi0==0
    phi0
end

n_1=1.51;
n_3=1.33;

show_grating_mesh=2; % 1-yes, 2-no

%---------------------------------------------------------
% generation of refractive index mesh
addpath('structures_scripts')
[p_x,p_y,mesh_n_mat]=rectangular_grid(Lambda_x,Lambda_y,resolution_dx,r_gold,n_cylinder,n_layer,show_grating_mesh);
%--------------------------------------------------------- 

l=1;

thickness(l)=h_cytop; % thickness of the layer

coordinate_x_1=Lambda_x.*[0,1];
coordinate_y_1=Lambda_y.*[0,1];

r_index_1=1.33;

% definition of layer number 2 
l=2;

nvm_method(l)=1; % 1=normal vector method is on (only in this layer)
factorization_method=1; % 1-radial, 2-complex radial, 3-
[N_x_input,N_y_input]=rectangular_grid_nvm(Lambda_x,Lambda_y,resolution_dx,factorization_method);

thickness(l)=h_gold; % thickness of the layer

coordinate_x_2=p_x;
coordinate_y_2=p_y;

r_index_2=mesh_n_mat; % matrix of the refrative index grid 

