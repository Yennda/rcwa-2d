number_of_layers = 5;

a = 10;
w = 1.33;

l = 1;
thickness(1) = 0.05;
coordinate_x_1 = [0, a];
coordinate_y_1 = [0, a];
r_index_1 = {gold};



l = 2;
thickness(2) = 0.03;
coordinate_x_2 = [0, a];
coordinate_y_2 = [0, a];
r_index_2 = {w};



l = 3;
thickness(3) = 0.03;
coordinate_x_3 = [0, 4.96, 4.9639999999999995, 4.968, 4.9719999999999995, 10];
coordinate_y_3 = [0, 4.96, 4.9639999999999995, 4.968, 4.9719999999999995, 10];
r_index_3 = [w, w, w, w, w;
w, w, w, w, w;
w, w, w, w, w;
w, w, w, w, w;
w, w, w, w, w];



l = 4;
thickness(4) = 0.03;
coordinate_x_4 = [0, 4.96, 4.9639999999999995, 4.968, 4.9719999999999995, 10];
coordinate_y_4 = [0, 4.96, 4.9639999999999995, 4.968, 4.9719999999999995, 10];
r_index_4 = [w, w, w, w, w;
w, w, w, w, w;
w, w, gold, gold, w;
w, w, gold, gold, w;
w, w, w, w, w];



l = 5;
thickness(5) = 0.03;
coordinate_x_5 = [0, 4.96, 4.9639999999999995, 4.968, 4.9719999999999995, 10];
coordinate_y_5 = [0, 4.96, 4.9639999999999995, 4.968, 4.9719999999999995, 10];
r_index_5 = [w, w, w, w, w;
w, w, w, w, w;
w, w, gold, gold, w;
w, w, gold, gold, w;
w, w, w, w, w];