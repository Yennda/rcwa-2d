% uloha: udelat řez ve vzdálenosti - z

plot_field_component=1; % 1-E_x, 2-E_y, 3-E_z, 4-H_x, 5-H_y, 6-H_z
field_function=3; % 1-abs, 2-angle, 3-real, 4-imag
set_grating_framework=2; % 1-yes, 2-no


xz_slice_coordinate_y=0.6;
resolution_x=200;
resolution_z=200;


%xz_slice_1_old; % input region
%z_points_1=z_points;

xz_slice_2_old; % grating region
z_points_2=z_points;


%xz_slice_3_old; % output region
%z_points_3=z_points;


figure
set(gcf, 'Renderer', 'zbuffer');
surf([z_points_1,z_points_2,z_points_3],1E6.*x_points,[profile_mode1,profile_mode2,profile_mode3]); shading flat
ylabel('x [\mu{}m]','FontSize',13);
xlabel('z [\mu{}m]','FontSize',13);

axis([z_points_1(1) z_points_3(end) coordinate_x_1(1) coordinate_x_1(end)]);

view([90 90])

