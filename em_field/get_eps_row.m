function eps_out=get_eps_row(y_get,z_coordinate,coordinate_y,thickness,eps_yz_slice)

%{
y_get=(0:0.1:1.2);

resolution_x=100;
z_coordinate=0.5;
coordinate_y=[0,0.2,0.3,0.45,0.75,0.9,1.0,1.2];


eps_yz_slice=[1 1 1.5 1.5 1.5 1 1;
   1 1.5 1.5 1.5 1.5 1.5 1];
   
thickness=[1,1,1.5];
%}


% ? kterou vrstvičku
thickness_tot=[0];

for i=1:1:length(thickness)
    thickness_tot(i+1)=sum(thickness(1:i));
end

use_eps_slice=eps_yz_slice(:,find(z_coordinate>=thickness_tot,1,'last'));

% přiřadit eps

eps_out=zeros(1,length(y_get));

for i=1:1:length(y_get)
    if y_get(i)==coordinate_y(1)
        eps_out(1)=use_eps_slice(1);
    elseif y_get(i)==coordinate_y(end);
        eps_out(end)=use_eps_slice(end);
    else
        eps_out(i)=use_eps_slice(find(coordinate_y>=y_get(i),1,'first')-1);
    end
end

eps_out=eps_out.^2;