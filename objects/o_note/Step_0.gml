ref_o = o_note_creator.pos_x
if collision_line(ref_o,0,ref_o,room_height,self,false,false) && o_note_creator.paused==false && note_play==false
{
		 note_play=true
}
if audio_is_playing(my_snd) && o_note_creator.pos_x<x
{
	finish=true
	note_play=false
	milliseconds=(sprite_width*25)
	audio_stop_sound(sound_id)
	is_playing=false
	sound_id = 0
	steps=0

}

if recalculate==true
{
	var _pox_x = x
	var line_x = o_note_creator.pos_x
	var distance = abs(_pox_x-line_x)
	var size = sprite_width-distance
	var mill=(size*25)
	steps = (ceil((mill / 1000) * room_speed))
	recalculate=false
}

if last_pos!=selected && selected==true && !place_meeting(x,y,o_note)
{
	menu_id=instance_create_layer(1133,97,"Line",o_note_configurer)
	menu_id.my_note=id
	menu_id.depth=line.depth-5
	menu_id.gain_val=max_gain
	menu_id.attack_val=attack_speed
	menu_id.release_val=release_speed
	menu_id.pitch_val=pitch_amt
}
else if selected==false && menu_id!=0
{
	instance_destroy(menu_id)
	menu_id=0
}

if selected==true
{
		var left_edge = x
		var right_edge = x+sprite_width
		var top = y-sprite_height/2
		var bottom = y+sprite_height/2

		if collision_rectangle(right_edge+2,top,right_edge-5,bottom,o_mouse,false,true) && o_mouse.prioraty==0 && !place_meeting(x,y,o_note_configurer)
		{
			//pull right
			o_mouse.image_index=2
			if mouse_check_button(mb_left) && off_mouse==0 && held==false && o_mouse.prioraty!=id
			{
				held=true
				org_x = x
				left=false
				original_xcale=image_xscale
			}
			
		}
		else if place_meeting(x,y,o_mouse)  && held==false && !place_meeting(x,y,o_note_configurer)
		{
			//move
			o_mouse.image_index=3
			if mouse_check_button_pressed(mb_left) && off_mouse==0 && o_mouse.prioraty==0
			{
				o_mouse.prioraty=id

			}
		}
		else if place_meeting(o_mouse.x,o_mouse.y,o_note_configurer) {o_mouse.image_index=0}
		else if !place_meeting(x,y,o_mouse) && held==false && o_mouse.prioraty==0 && !place_meeting(x,y,o_note_configurer) 
		{
			o_mouse.image_index=4
			if mouse_check_button_pressed(mb_left) && off_mouse==0
			{
				selected=false
				selected_id=0
				o_mouse.selectee=0
			}
		}
		

}

if off_mouse>0 {off_mouse--}
var width_s = left==true ? sprite_get_width(s_notes): sprite_get_width(s_notes)*-1;
if mouse_check_button(mb_left) && held==true && off_mouse==0 && o_mouse.prioraty!=id
	{
			var last_xcale=image_xscale
			var pos = get_closest_val(o_note_creator.grid_x_arr,x-(sprite_width/2))/10
			var dist = 1 + (get_closest_val(o_note_creator.grid_x_arr,o_mouse.x-(sprite_width/2)-o_mouse.sprite_width/2)/10) - pos
			image_xscale = dist/2
			if image_xscale<=0 {image_xscale=1}
	}
else if mouse_check_button_released(mb_left) && place_meeting(x,y,o_note) && held==true
{
	image_xscale=original_xcale
	held=false
}
else if mouse_check_button_released(mb_left) && !place_meeting(x,y,o_note) && held==true {held=false}

//NOTE SYTHZIER
if o_note_creator.paused==true{audio_pause_sound(sound_id)}
else if audio_is_paused(sound_id) {audio_resume_sound(sound_id)} 

if o_note_creator.paused==false
{
	

	// decide target
	if steps > 0
	{
	    target_gain = max_gain
	}
	else
	{
	    target_gain = 0
	}

	// move toward target
	if target_gain==max_gain
	{
		curent_gain = lerp(curent_gain, target_gain, attack_speed)
	}
	else 
	{
		curent_gain = lerp(curent_gain, target_gain, release_speed)
	}
	
	

	if (sound_id != 0)
	{
	    audio_sound_gain(sound_id, curent_gain, 0)
		audio_sound_pitch(sound_id,pitch_amt)
	}

	if (round(curent_gain * 100) / 100)<=0 && sound_id!=0
	{
		audio_stop_sound(sound_id)
		sound_id = 0
		finish=true
		note_play=false
		show_debug_message("ended")
	}

	// start sound once
	if note_play==true && sound_id==0
	{
		show_debug_message("started")
	
		milliseconds=(sprite_width*25)
		if audio_sound_is_playable(sound_id) {audio_stop_sound(sound_id)}
		is_playing=false
		sound_id = 0
		steps=0
		steps = ceil((milliseconds / 1000) * room_speed)
		is_playing = true
		sound_id = audio_play_sound(my_snd, 0, true,0)

	}


	if steps > 0
	{
		steps--
	}
}

if place_meeting(x,y,o_note) or place_meeting(x,y,o_note_creator)
{
	o_mouse.touching=true
}
else {o_mouse.touching=false}

