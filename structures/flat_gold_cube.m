number_of_layers=3;

w = 1.33;
a = 10;
r = 0.1;

l=1; % layer 1
thickness(l)=0.05;

coordinate_x_1=a*[0,1];
coordinate_y_1=a*[0,1];

r_index_1=[gold];


l=2; % layer 1
thickness(l)=0.02;
coordinate_x_2=a*[0,1];
coordinate_y_2=a*[0,1];
r_index_2=[w];




l=3; % layer 2
thickness(l)=r;

coordinate_x_3=[0, a/2-r/2, a/2+r/2, a];
coordinate_y_3=[0, a/2-r/2, a/2+r/2, a];

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
