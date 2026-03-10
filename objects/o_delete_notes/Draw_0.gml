draw_self()

if o_mouse.selecting_zone==true or o_mouse.moving_zone==true
{
	if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left)
	{
		image_xscale=0.9
		image_yscale=0.9
	}
	
	if clicks==1
	{
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		
		draw_set_font(Font_Notes_Type_12)
		draw_text(x-sprite_width/2,y-sprite_height*1.8,"Click again to delete all selected notes.")
		image_index=1
	}
	else {image_index=0}
	
	if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) && clicks==0
	{
		clicks=1
	}
	else if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) && clicks==1
	{
		var temp_array = o_mouse.selected_array
		
		for (i=0;i<array_length(temp_array); i++)
		{
			instance_destroy(temp_array[i])
		}
			o_mouse.selecting_zone=false
			o_mouse.moving_zone=false
			o_mouse.start_x=0
			o_mouse.start_y=0
			o_mouse.final_x=0
			o_mouse.final_y=0
			clicks=0


	}
}
else
{
	x=wait_x
	y=wait_y
	clicks=0
}

if image_xscale!=1 {image_xscale+=0.01; image_yscale+=0.01}