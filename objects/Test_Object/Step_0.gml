if mouse_check_button_pressed(mb_left) {note_play=true}


// decide target
if steps > 0
{
    target_gain = 1
}
else
{
    target_gain = 0
}

// move toward target
if target_gain==1
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
	
	audio_stop_sound(sound_id)
	is_playing=false
	sound_id = 0
	steps=0
	
	steps = ceil((milliseconds / 1000) * 60)
	is_playing = true
	sound_id = audio_play_sound(Sound_Test, 0, true,0)

}



if steps > 0 && (round(curent_gain * 100) / 100)>=target_gain
{
	steps--
}
