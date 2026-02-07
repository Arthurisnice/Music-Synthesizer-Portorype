if spawn==true 
{
	paused=true
	if o_mouse.prioraty!=0 {audio_stop_all() ;instance_destroy(o_mouse.prioraty)}
	var temp_note =	instance_create_layer(mouse_x,mouse_y,"notes",o_note);
	o_mouse.prioraty=temp_note.id
	with(temp_note)
	{
		my_snd=temp_note.my_snd_arr[o_Instrument_chooser.val_to_send]
		temp_sound = audio_play_sound(temp_note.my_snd_arr[o_Instrument_chooser.val_to_send],0,true,o_note_creator.note_max_gain,0,o_note_creator.note_pitch_amt)
		alarm[0]=10
		note_index=o_Instrument_chooser.valeu
		max_gain=o_note_creator.note_max_gain
		attack_speed=o_note_creator.note_attack_speed
		release_speed=o_note_creator.note_release_speed
		pitch_amt=o_note_creator.note_pitch_amt
		my_text=o_note_creator.note_text
	}
	o_mouse.selectee=0
	o_note.selected=false
	spawn=false
}

if keyboard_check_pressed(ord("F")) && !window_get_fullscreen()
{
	window_set_fullscreen(true)
}
else if keyboard_check_pressed(ord("F")) && window_get_fullscreen()
{
	window_set_fullscreen(false)
}


