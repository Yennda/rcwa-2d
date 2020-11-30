if xz_slice_coordinate_y>coordinate_united_y(end) || xz_slice_coordinate_y<coordinate_united_y(1)
    error('out of range')
end

position_in_eps=1;
for i=2:1:length(coordinate_united_y)
    if coordinate_united_y(i)>=xz_slice_coordinate_y
        break
    else
        position_in_eps=position_in_eps+1;
    end
end

% vybrat všechny epsilony pro xz_slice

eps_xz_slice=zeros(length(coordinate_united_y)-1,number_of_layers);

for i=1:1:number_of_layers
    eps_to_slice=eval(['new_r_index_' num2str(i)]);
    eps_xz_slice(:,i)=eps_to_slice(position_in_eps,:);
end