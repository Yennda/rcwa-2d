number_of_layers = 10;

a = 20;
b = 10;
dx = 5;
h = 0.02;
r = 0.04;
nxy = 8;
w = 1.33;


l = 1;
thickness(l) = 0.05;
coordinate_x_1 = [0, a];
coordinate_y_1 = [0, b];
r_index_1 = [gold];



l = 2;
thickness(l) = h;
coordinate_x_2 = [0, a];
coordinate_y_2 = [0, b];
r_index_2 = [w];



l = 3;
thickness(l) = 0.01;
coordinate_x_3 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_3 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_3 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, gold, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];



l = 4;
thickness(l) = 0.01;
coordinate_x_4 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_4 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_4 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];



l = 5;
thickness(l) = 0.01;
coordinate_x_5 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_5 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_5 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];



l = 6;
thickness(l) = 0.01;
coordinate_x_6 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_6 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_6 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];



l = 7;
thickness(l) = 0.01;
coordinate_x_7 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_7 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_7 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, gold, w, w, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, gold, gold, gold, gold, gold, gold, gold, gold, gold, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, w, w, gold, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];



l = 8;
thickness(l) = 0.01;
coordinate_x_8 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_8 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_8 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];



l = 9;
thickness(l) = 0.01;
coordinate_x_9 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_9 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_9 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, gold, gold, gold, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];



l = 10;
thickness(l) = 0.01;
coordinate_x_10 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, (a-r)/2 + r/nxy*7 + dx, (a-r)/2 + r/nxy*8 + dx, (a-r)/2 + r/nxy*9 + dx, a];
coordinate_y_10 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, (b-r)/2 + r/nxy*7, (b-r)/2 + r/nxy*8, (b-r)/2 + r/nxy*9, b];
r_index_10 = [w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, gold, gold, gold, gold, gold, w, w, w;
w, w, w, w, gold, gold, gold, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w, w, w, w];
