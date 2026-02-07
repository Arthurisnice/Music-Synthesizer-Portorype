ref_o = o_note_creator.pos_x
	
attack_speed=clamp(base_atkk_speed*(o_note_creator.bpm/60),0.001,1)
release_speed=base_release_speed*(o_note_creator.bpm/60)

if _org_alpha>=1
{
	if collision_line(ref_o,0,ref_o,room_height,self,false,false) && selected_in_zone==false  && o_note_creator.paused==false && note_play==false
	{
			 note_play=true
	}
	if audio_is_playing(my_snd) && o_note_creator.pos_x<x
	{
		note_play=false
		//milliseconds=(sprite_width*25)
		audio_stop_sound(sound_id)
		is_playing=false
		sound_id = 0
		steps=0
	}

	if place_meeting(x,y,o_trash_can) && mouse_check_button_pressed(mb_left)
	{
		audio_stop_sound(temp_sound)
		instance_destroy()
	}

	if recalculate==true
	{
		var dist=o_note_creator.pos_x-x
		var amount = 1-dist/sprite_width
		steps=(ceil((60/((24)*(o_note_creator.bpm/60)))*sprite_width))*amount
		show_debug_message("Recalculating: " + string(amount))
		recalculate=false
	}

	if last_pos!=selected && selected==true && !place_meeting(x,y,o_note) && selected_in_zone==false 
	{
		menu_id=instance_create_layer(o_mouse.conf_x,o_mouse.conf_y,"Line",o_note_configurer)
		menu_id.mode=0
		menu_id.my_note=id
		menu_id.depth=line.depth-5
		menu_id.gain_val=max_gain
		menu_id.attack_val=base_atkk_speed
		menu_id.release_val=base_release_speed
		menu_id.pitch_val=pitch_amt
	}
	else if selected==false && menu_id!=0
	{
		instance_destroy(menu_id)
		menu_id=0
	}
}
if selected_in_zone==true {selected=false}
if selected==true && selected_in_zone==false
{
		var left_edge = x
		var right_edge = x+sprite_width
		var top = y-sprite_height/2
		var bottom = y+sprite_height/2

		if collision_rectangle(right_edge+3,top,right_edge-3,bottom,o_mouse,false,true) && o_mouse.prioraty==0 && !place_meeting(x,y,o_note_configurer)
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
			var pos = get_closest_val(o_note_creator.grid_x_arr,x-(sprite_width/2))/(sprite_wd/2)
			var dist = 1 + (get_closest_val(o_note_creator.grid_x_arr,o_mouse.x-(sprite_width/2)-o_mouse.sprite_width/2)/(sprite_wd/2)) - pos
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
if o_note_creator.paused==true or muted==true {audio_pause_sound(sound_id)}
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
	
	curent_gain=clamp(curent_gain,0,max_gain)

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
		
		steps = ceil((60/(24*(o_note_creator.bpm/60)))*sprite_width)
		if o_note_creator.bpm=120 {steps=steps+2}
		
		show_debug_message("started")
		if audio_sound_is_playable(sound_id) {audio_stop_sound(sound_id)}
		is_playing=false
		sound_id = 0

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


if o_aintr_ctrl.mute_arr[0]==true  && o_note_creator.paused==false && note_index==0
{
	audio_pause_sound(my_snd)
}
else if o_aintr_ctrl.mute_arr[1]==true  && o_note_creator.paused==false && note_index==1
{
	audio_pause_sound(my_snd)
}
else if o_aintr_ctrl.mute_arr[2]==true  && o_note_creator.paused==false && note_index==2
{
	audio_pause_sound(my_snd)
}
else if o_aintr_ctrl.mute_arr[3]==true  && o_note_creator.paused==false && note_index==3
{
	audio_pause_sound(my_snd)
}
else if o_aintr_ctrl.mute_arr[4]==true  && o_note_creator.paused==false && note_index==4
{
	audio_pause_sound(my_snd)
}
else if o_aintr_ctrl.mute_arr[5]==true  && o_note_creator.paused==false && note_index==5
{
	audio_pause_sound(my_snd)
}
else if o_note_creator.paused==false {audio_resume_sound(my_snd)}

if place_meeting(x,y,o_note)
{
	o_mouse.note_colision=true
}
else {o_mouse.note_colision=false}