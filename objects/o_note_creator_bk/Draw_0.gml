//GRID DRAW CODE_____________________________


var grid_x_leng = array_length(grid_x_arr)

for (i=0;i<grid_x_leng;i++)
{
	draw_set_alpha(0.3)
	draw_line_width_colour(grid_x_arr[i],0,grid_x_arr[i],room_width,1,c_gray,c_gray)
}

var grid_y_leng = array_length(grid_y_arr)

for (i=0;i<grid_y_leng;i++)
{
 
	draw_line_width_colour(0,grid_y_arr[i],room_width,grid_y_arr[i],1,c_gray,c_gray)
}

draw_set_alpha(1)