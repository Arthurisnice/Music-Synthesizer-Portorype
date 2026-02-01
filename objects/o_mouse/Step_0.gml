x=mouse_x
y=mouse_y

if prioraty!=0 
{
		with(prioraty)
		{
			if !place_meeting(x,y,o_note_creator)
			{
				x = get_closest_val(o_note_creator.grid_x_arr,o_mouse.x-sprite_width/2)
				y = get_closest_val(o_note_creator.grid_y_arr,o_mouse.y)-sprite_height/2
			}
			else {x=o_mouse.x-sprite_width/2; y=o_mouse.y}
		}
}

with(prioraty)
{ 
	if mouse_check_button_pressed(mb_left) && !place_meeting(x,y,o_note) && !place_meeting(x,y,o_note_creator)
	{
		off_mouse=10
		o_mouse.prioraty=0
		o_mouse.offset_x=0
		selected_id=id
	}
}

if selectee==0 {image_index=0}

if copy==true
{
	with(o_note_creator)
	{
			paused=true
			if o_mouse.prioraty!=0 {audio_stop_all() ;instance_destroy(o_mouse.prioraty)}
			var temp_note =	instance_create_layer(mouse_x,mouse_y,"notes",o_note);
			o_mouse.prioraty=temp_note.id
			temp_note.my_snd=temp_note.my_snd_arr[o_mouse.note_val]
			temp_note.temp_sound = audio_play_sound(temp_note.my_snd_arr[o_mouse.note_val],0,true,0.5)
			temp_note.alarm[0]=10
			temp_note.note_index=o_mouse.note_val
			o_mouse.selectee=0
			o_note.selected=false
			with(temp_note)
			{
				max_gain=o_mouse.nt_max_gain
				release_amt=o_mouse.nt_release_speed
				attack_speed=o_mouse. nt_attack_speed
				pitch_amt=o_mouse.nt_pitch_amt
				image_xscale=o_mouse.nt_scale
			}
	}
	copy=false
}

