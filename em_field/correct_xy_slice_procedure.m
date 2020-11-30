%{
clear all

resolution_x=300;
resolution_y=400;

coordinate_x=[0,0.3,0.9,1.2];
coordinate_y=[0,0.3,0.6,0.9,1.2];

x_point_b=coordinate_x(1);
x_point_e=coordinate_x(end);

y_point_b=coordinate_y(1);
y_point_e=coordinate_y(end);

x_points=x_point_b:((x_point_e-x_point_b)/resolution_x):(x_point_e);
y_points=y_point_b:((y_point_e-y_point_b)/resolution_y):(y_point_e);

D=zeros(length(y_points),length(x_points))+1;
E=zeros(length(y_points),length(x_points))+2;
%}

new_epsilon=zeros(length(y_points),length(x_points));
new_E_l_r=zeros(length(y_points),length(x_points));
new_E_t_b=zeros(length(y_points),length(x_points));

r_index=r_index_1;
size_r_index=size(r_index);

% hledání homogenních částí
% z leva do prava

hom_l_r=zeros(size_r_index(1),1);
hom_t_b=zeros(1,size_r_index(2));

for i=1:1:size_r_index(1)
    if length(unique(r_index(i,:)))==1
        hom_l_r(i)=1;
    end
end

for i=1:1:size_r_index(2)
    if length(unique(r_index(:,i)))==1
        hom_t_b(i)=1;
    end
end

% jestli je oblast homogenní, tak vem E, jinak D
% -> l_t

for i=1:1:size_r_index(1)
    
    y_beg=find(y_points>=coordinate_y_1(i)*1e-6,1,'first');    
    y_end=find(y_points>=coordinate_y_1(i+1)*1e-6,1,'first');
    
    if hom_l_r(i)==1 % get E
        new_E_l_r(y_beg:y_end,:)=profile_mode_E(y_beg:y_end,:);
    else % get D
        new_E_l_r(y_beg:y_end,:)=profile_mode_D(y_beg:y_end,:);
    end
end

for i=1:1:size_r_index(2)
    
    x_beg=find(x_points>=coordinate_x_1(i)*1e-6,1,'first');    
    x_end=find(x_points>=coordinate_x_1(i+1)*1e-6,1,'first');
    
    if hom_t_b(i)==1 % get E
        new_E_t_b(:,x_beg:x_end)=profile_mode_E(:,x_beg:x_end);
    else % get D
        new_E_t_b(:,x_beg:x_end)=profile_mode_D(:,x_beg:x_end);
    end
end

if plot_field_component==2 % get E        
    profile_mode=new_E_l_r;    
elseif plot_field_component==1        
    profile_mode=new_E_t_b;    
end

%figure;surf(new_E_l_r); shading flat; view([0 -90]);
%figure;surf(new_E_t_b); shading flat; view([0 -90]);


