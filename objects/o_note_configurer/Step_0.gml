if point_in_rectangle(o_mouse.x,o_mouse.y,x,y,x+sprite_width,y+10) && o_mouse.prioraty==0 && mouse_check_button_pressed(mb_left)
{
	_offet_x = o_mouse.x-x
	_offet_y = o_mouse.y-y
	held=true
}
else if held==true && o_mouse.prioraty==0 && mouse_check_button(mb_left)
{
	target_x=o_mouse.x-_offet_x
	target_y=o_mouse.y-_offet_y
}
else if mouse_check_button_released(mb_left)
{
	held=false
	_offet_x=0
	_offet_y=0
	o_mouse.conf_x=x
	o_mouse.conf_y=y
}

x=target_x
y=target_y