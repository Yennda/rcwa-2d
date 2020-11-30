function get_eps_result=get_epsilon(get_eps_x,get_eps_y,coordinate_x,coordinate_y,r_index)

%{
get_eps_x=0.2;
get_eps_y=0.29;
coordinate_x=[0,0.3,0.9,1.2];
coordinate_y=[0,0.3,0.9,1.2];
r_index=[1, 1, 1;
    1.5, 1.5, 1;
    1, 1, 1;];
%}

%x_r_index=find(coordinate_x<get_eps_x,1,'last');
%y_r_index=find(coordinate_y<get_eps_y,1,'last');

x_r_index=binarySearch(coordinate_x, get_eps_x, 'last','down');
y_r_index=binarySearch(coordinate_y, get_eps_y, 'last','down');

get_eps_result=r_index(y_r_index,x_r_index);