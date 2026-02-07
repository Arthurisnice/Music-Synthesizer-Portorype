if timer>10 && instance_exists(o_note)
{
	timer--
	draw_set_colour(c_red)
	draw_set_font(Font_Warning_50)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(room_width/2,room_height/2,"Are you sure?\nThis will delete all notes present!\nPress ENTER to continue.\ntime you have to decide:"+string(timer)+"...")
}
else if timer>10 && instance_exists(o_note)
{
	if timer>1 {timer=1}
	timer-=0.1
	draw_set_colour(c_red)
	draw_set_font(Font_Warning_50)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_alpha(timer)
	draw_text(room_width/2,room_height/2,"Are you sure?\nThis will delete all notes present!\nPress ENTER to continue.\ntime you have to decide:"+string(timer)+"...")
	draw_set_alpha(1)
}
else if timer>0 && !instance_exists(o_note)
{
	timer=0
	ready=true
	image_angle+=side
	cnt=1
}

if (timer>0 && keyboard_check_pressed(vk_enter)) or ready==true
{
	image_angle+=side
	cnt=1
	timer=0
	ready=false
	audio_stop_all()
	instance_destroy(o_note)
	for (i=0;i<array_length(note_recive_arr);i++)
	{
		var temp_note =	instance_create_layer(mouse_x,mouse_y,"notes",o_note);
		with (temp_note)
		{
			var _arr = o_save.note_recive_arr[other.i]
			if _arr[0]==0 {note_index=6}
			else {note_index=_arr[0]}
			max_gain=_arr[1]
			base_atkk_speed=_arr[2]
			base_release_speed=_arr[3]
			pitch_amt=_arr[4]
			my_text=_arr[5]
			image_xscale=_arr[6]
			x=_arr[7]
			y=_arr[8]
			my_snd=my_snd_arr[note_index]
			if place_meeting(x,y,o_note_creator) {instance_destroy(temp_note)}
		}
	}
}

draw_self()



draw_set_colour(c_black)
draw_set_alpha(0.2)
if place_meeting(x,y,o_mouse) && o_mouse.y<y+2
{
	//ABOVE -> LOAD
	if mouse_check_button_pressed(mb_left) {try_save=true; side=choose(10,-10)}
	draw_rectangle(x-sprite_width/2,y,x+sprite_width/2,y-sprite_height/2,false)
}

if place_meeting(x,y,o_mouse) && o_mouse.y>y-2
{
	//BELOW -> SAVE
	if mouse_check_button_pressed(mb_left) {try_load=true; side=choose(10,-10)}
	draw_rectangle(x-sprite_width/2,y,x+sprite_width/2,y+sprite_height/2,false)
}
draw_set_colour(c_white)
draw_set_alpha(1)

draw_set_halign(fa_right)
draw_set_valign(fa_middle)
draw_set_font(Font_Notes_Type_12)

if o_mouse.debugg==1 or o_mouse.debugg==4
{
	
	draw_text(x, y+15,
    "working_directory: " + string(working_directory) + "\n" )

}


draw_set_halign(fa_left)
draw_set_valign(fa_top)