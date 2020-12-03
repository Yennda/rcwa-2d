number_of_layers = 7;

a = 20;
b = 10;
dx = 3;
h = 0.03;
r = 0.08;
nxy = 5;
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
thickness(l) = 0.02;
coordinate_x_3 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, a];
coordinate_y_3 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, b];
r_index_3 = [w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w];



l = 4;
thickness(l) = 0.02;
coordinate_x_4 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, a];
coordinate_y_4 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, b];
r_index_4 = [w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, gold, gold, w, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, w, gold, gold, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w];



l = 5;
thickness(l) = 0.02;
coordinate_x_5 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, a];
coordinate_y_5 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, b];
r_index_5 = [w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w];



l = 6;
thickness(l) = 0.02;
coordinate_x_6 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, a];
coordinate_y_6 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, b];
r_index_6 = [w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w];



l = 7;
thickness(l) = 0.02;
coordinate_x_7 = [0, (a-r)/2 + r/nxy*0 + dx, (a-r)/2 + r/nxy*1 + dx, (a-r)/2 + r/nxy*2 + dx, (a-r)/2 + r/nxy*3 + dx, (a-r)/2 + r/nxy*4 + dx, (a-r)/2 + r/nxy*5 + dx, (a-r)/2 + r/nxy*6 + dx, a];
coordinate_y_7 = [0, (b-r)/2 + r/nxy*0, (b-r)/2 + r/nxy*1, (b-r)/2 + r/nxy*2, (b-r)/2 + r/nxy*3, (b-r)/2 + r/nxy*4, (b-r)/2 + r/nxy*5, (b-r)/2 + r/nxy*6, b];
r_index_7 = [w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, gold, gold, w, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, gold, gold, gold, gold, w, w;
w, w, w, gold, gold, w, w, w;
w, w, w, w, w, w, w, w;
w, w, w, w, w, w, w, w];

