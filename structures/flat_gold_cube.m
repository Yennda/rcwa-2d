number_of_layers=1;

w = 1.33;

l=1; % layer 1
thickness(l)=0.05;

coordinate_x_1=10*[0,1];
coordinate_y_1=10*[0,1];

r_index_1=[gold];


l=2; % layer 1
thickness(l)=0.02;
coordinate_x_2=10*[0,1];
coordinate_y_2=10*[0,1];
r_index_2=[w];




l=3; % layer 2
thickness(l)=0.1;

coordinate_x_3=[0, 4.95, 5.05, 10];
coordinate_y_3=[0, 4.95, 5.05, 10];

r_index_3=[w, w, w;
    w, gold, w;
    w, w, w];


% l=3; % layer 3
% thickness(l)=0.5;
% 
% coordinate_x_3=1.2.*[0,1];
% coordinate_y_3=1.2.*[0,1];
% 
% r_index_3=1.5;
