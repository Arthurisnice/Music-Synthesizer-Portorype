x=o_mouse.cam_pos_x+x_offset_mine

draw_rectangle_colour(o_mouse.cam_pos_x,room_height-32,o_mouse.cam_pos_x+1280,room_height,c_gray,c_gray,c_gray,c_gray,false)
diff=o_mouse.cam_pos_x/mult
draw_rectangle_colour(o_mouse.cam_pos_x+diff,room_height-32,o_mouse.cam_pos_x+56+diff,room_height,c_white,c_white,c_white,c_white,true)


if point_in_rectangle(o_mouse.x,o_mouse.y,o_mouse.cam_pos_x,room_height-32,o_mouse.cam_pos_x+1280,room_height)  && mouse_check_button(mb_left)
{
	var pos_to = (o_mouse.x-x)*4
	if pos_to>5100 {pos_to=5100}
	o_mouse.cam_pos_x=pos_to
	camera_set_view_pos(view_camera[0], o_mouse.cam_pos_x, o_mouse.cam_pos_y)
	txt=string(pos_to)
}

//draw_text(x+20,200,txt+" / "+string(o_mouse.cam_pos_x))