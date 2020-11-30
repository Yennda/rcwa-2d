if yz_slice_coordinate_x>coordinate_united_x(end) || yz_slice_coordinate_x<coordinate_united_x(1)
    error('out of range')
end

position_in_eps=1;
for i=2:1:length(coordinate_united_x)
    if coordinate_united_x(i)>=yz_slice_coordinate_x
        break
    else
        position_in_eps=position_in_eps+1;
    end
end

% vybrat všechny epsilony pro yz_slice

eps_yz_slice=zeros(length(coordinate_united_y)-1,number_of_layers);

for i=1:1:number_of_layers
    eps_to_slice=eval(['new_r_index_' num2str(i)]);
    eps_yz_slice(:,i)=eps_to_slice(:,position_in_eps);
end