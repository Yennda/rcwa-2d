% simple waveguide
% vsechny casti musi mit stejne periody
% vsechny casti musi mit stejne nastaveni sirek PML vrstev 

lambda=0.3;
number_of_layers=1;

mu=1;


thickness(1)=1;

coordinate_x_1=[0,0.2,0.3,0.5];
coordinate_y_1=[0,0.075,0.175,0.25];

%coordinate_u_1=coordinate_x_1;
%coordinate_v_1=coordinate_y_1;

r_index_1=[1, 1, 1;
    1, 3, 1;
    1, 1, 1];
