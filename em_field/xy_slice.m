% xy_slice

plot_field_component=5; % 1-E_x, 2-E_y, 3-E_z, 4-H_x, 5-H_y, 6-H_z
field_function=0; % 1-abs, 2-angle, 3-real, 4-imag
set_grating_framework=2; % 1-yes, 2-no
correct_calculation=1; % 1-yes, 2-no, only for 1-E_x, 2-E_y

% plot_field_component=7 -> E_x, plot_field_component=8 -> E_y

xy_slice_coordinate_z=-1;
resolution_x=300;
resolution_y=300;

x_point_b=coordinate_x_1(1);
x_point_e=coordinate_x_1(end);

y_point_b=coordinate_y_1(1);
y_point_e=coordinate_y_1(end);

%-------------------------------------------------------------------------
xy_slice_view=1;
if xy_slice_coordinate_z<=0
    xy_slice_1; % input region
elseif xy_slice_coordinate_z>0 && xy_slice_coordinate_z<sum(thickness)
    if correct_calculation==1
        temp_plot_field_component=plot_field_component;
        for i=1:1:2
            if i==1
                xy_slice_2;
                profile_mode_E=profile_mode;
                %figure; surf(profile_mode_E); shading flat;
            elseif i==2
                if temp_plot_field_component==1
                    plot_field_component=7; % D_x
                elseif temp_plot_field_component==2
                    plot_field_component=8;
                end
                xy_slice_2;
                profile_mode_D=1.0.*profile_mode;
                %figure; surf(profile_mode_D); shading flat;
            end
            
        end
        plot_field_component=temp_plot_field_component;
    else
    xy_slice_2; % grating region
    end
elseif xy_slice_coordinate_z>=sum(thickness)
    xy_slice_3; % output region
end
xy_slice_view=2;

%{
for ii=1:1:600   
    for jj=1:1:600
        if profile_mode(ii,jj)>9.076
            profile_mode(ii,jj)=9.076;
        end
    end
end
%}

if xy_slice_coordinate_z>0 && xy_slice_coordinate_z<sum(thickness)
    if correct_calculation==1
        correct_xy_slice_procedure;
    end
end

figure
set(gcf, 'Renderer', 'zbuffer');
axes('FontSize',13)
surf(1E6.*y_points,1E6.*x_points,profile_mode,'LineWidth',1);

shading flat
axis([y_point_b y_point_e x_point_b x_point_e]);
ylabel('x [\mu{}m]','FontSize',13);
xlabel('y [\mu{}m]','FontSize',13);
%view([90 90]);

if set_grating_framework==1
hold on;
grating_framework;
end

view([0 90])