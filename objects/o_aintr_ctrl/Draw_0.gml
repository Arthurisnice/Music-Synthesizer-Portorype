draw_self()

draw_set_colour(c_white)
// for the show buttons
if o_mouse.touching==false
{
	for (i=0;i<6;i++)
	{
		var size=13
		var offset=46*i
		var x_pos=x+12
		var y_pos=y+49
	
		if show_arr[i]==true
		{
			draw_sprite(sprite_index,1,x+offset,y)	
		}
	
		if point_in_rectangle(o_mouse.x,o_mouse.y,x_pos+offset,y_pos,x_pos+offset+42,y_pos+size)
		{
		
			if show_arr[i]==true && mouse_check_button_pressed(mb_left) {show_arr[i]=false}
			else if show_arr[i]==false && mouse_check_button_pressed(mb_left) {show_arr[i]=true}
		
			draw_set_alpha(0.2)
			draw_set_colour(c_black)
			draw_rectangle(x_pos+offset,y_pos,x_pos+offset+42,y_pos+size,false)
			draw_set_alpha(1)
			draw_set_colour(c_white)
		}


	}

	//for the mute buttons
	for (i=0;i<6;i++)
	{
		var size=13
		var offset=46*i
		var x_pos=x+12
		var y_pos=y+65

		if mute_arr[i]==true
		{
			draw_sprite(sprite_index,2,x+offset,y)	
		}
	
		if point_in_rectangle(o_mouse.x,o_mouse.y,x_pos+offset,y_pos,x_pos+offset+42,y_pos+size)
		{
			if mute_arr[i]==true && mouse_check_button_pressed(mb_left) {mute_arr[i]=false}
			else if mute_arr[i]==false && mouse_check_button_pressed(mb_left) {mute_arr[i]=true}
		
			draw_set_alpha(0.2)
			draw_set_colour(c_black)
			draw_rectangle(x_pos+offset,y_pos,x_pos+offset+42,y_pos+size,false)
			draw_set_alpha(1)
			draw_set_colour(c_white)
		}
	
	
	}

	//for both_buttons
	for (i=0;i<6;i++)
	{
		var size=41
		var offset=46*i
		var x_pos=x+11
		var y_pos=y+8

		if mute_arr[i]==false or show_arr[i]==false {both_arr[i]=false}
	
		if point_in_rectangle(o_mouse.x,o_mouse.y,x_pos+offset,y_pos,x_pos+offset+size,y_pos+size)
		{
			if both_arr[i]==true && mouse_check_button_pressed(mb_left) {both_arr[i]=false; mute_arr[i]=false; show_arr[i]=false}
			else if both_arr[i]==false && mouse_check_button_pressed(mb_left) {both_arr[i]=true; mute_arr[i]=true; show_arr[i]=true}
		
		
			draw_set_alpha(0.2)
			draw_set_colour(c_black)
			draw_rectangle(x_pos+offset,y_pos,x_pos+offset+size,y_pos+size,false)
			draw_set_alpha(1)
			draw_set_colour(c_white)
		}
	
	
	}
}


