% uloha: udelat řez ve vzdálenosti - z

plot_field_component=1; % 1-E_x, 2-E_y, 3-E_z, 4-H_x, 5-H_y, 6-H_z
field_function=3; % 1-abs, 2-angle, 3-real, 4-imag
set_grating_framework=2; % 1-yes, 2-no


yz_slice_coordinate_x=0.6;
resolution_y=200;
resolution_z=200;


yz_slice_1; % input region
z_points_1=z_points;

yz_slice_2; % grating region
z_points_2=z_points;


yz_slice_3; % output region
z_points_3=z_points;

figure
set(gcf, 'Renderer', 'zbuffer');
surf(1E6.*y_points,[z_points_1,z_points_2,z_points_3],[profile_mode1;profile_mode2;profile_mode3]); shading flat
xlabel('y [\mu{}m]','FontSize',13);
ylabel('z [\mu{}m]','FontSize',13);

axis([coordinate_y_1(1) coordinate_y_1(end) z_points_1(1) z_points_3(end)]);

view([0 -90])

