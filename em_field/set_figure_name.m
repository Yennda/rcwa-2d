
if field_function==1
    figure_name_1='abs(';
    figure_name_3=')^2'; 
elseif field_function==2
    figure_name_1='abs(';
    figure_name_3=')';
elseif field_function==3
    figure_name_1='abs(';
    figure_name_3=')';
elseif field_function==4
    figure_name_1='abs(';
    figure_name_3=')';
end

if set_plot_field_component==1
    figure_name_2='E_x';
elseif set_plot_field_component==2
    figure_name_2='E_y';
elseif set_plot_field_component==3
    figure_name_2='E_z';
elseif set_plot_field_component==4
    figure_name_2='H_x';
elseif set_plot_field_component==5
    figure_name_2='H_y';
elseif set_plot_field_component==6
    figure_name_2='H_z';
end

figure_name=[figure_name_1,figure_name_2,figure_name_3];
figure('name',figure_name);