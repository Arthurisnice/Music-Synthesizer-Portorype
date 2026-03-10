if place_meeting(x,y,o_mouse) {draw_set_colour(c_gray)}
else {draw_set_colour(c_white)}

draw_sprite(sprite_index,image_index,x,y)

draw_set_colour(c_white)

if text_timer>0
{
	draw_set_font(Font_Notes_show_30)
	draw_set_colour(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(o_mouse.cam_pos_x+1280/2,room_height/2,"Delete all notes first!")
	text_timer--
}

if place_meeting(x,y,o_mouse) && instance_exists(o_note) && mouse_check_button_pressed(mb_left)
{
	text_timer=60
}

if place_meeting(x,y,o_mouse) && !instance_exists(o_note) && o_mouse.note_colision==false && o_mouse.touching==false && mouse_check_button_pressed(mb_left)
{
	get_text=true
	keyboard_string=""
	my_text=""
}

if try_load==true
{
	try_load=false

	var _b64_string = my_text;
    
	if is_valid_compression(_b64_string)==true
	{
		show_debug_message("attempting actual decompression:")
	    // 1. Decode Base64 back to a compressed buffer
	    var _compressed_buff = buffer_base64_decode(_b64_string);
    
	    // 2. Decompress the buffer
	    var _decompressed_buff = buffer_decompress(_compressed_buff);
    
	    if (_decompressed_buff != -1) {
	        // 3. Read the string and parse it back to a struct
	        var _json_string = buffer_read(_decompressed_buff, buffer_string);
	        var _loaded_struct = json_parse(_json_string);
        
	        // Use your data!
			show_debug_message("__________POST COMRPESSION_____________")
	        show_debug_message(_loaded_struct)
			
				if is_valid_json(_json_string)==true
				{
					var text = json_parse(_json_string)
					var notes_array_temp = array_create(1,text.notes_array)
					for (var l=0;l<array_length(notes_array_temp[0]);l++)
					{
						note_recive_arr[l]=notes_array_temp[0][l]
					}
					show_debug_message("(>>\LOADED JSON-\n"+string(note_recive_arr)+"\n<<)")
					o_note_creator.bpm=text.bpm
				}
				else
				{
					instance_create_depth(o_mouse.cam_pos_x+1280/2,room_height/2,depth-5,o_save_wrong)
				}
				
				timer=120
				
	        buffer_delete(_decompressed_buff);
	    }
    
	    buffer_delete(_compressed_buff);
	}
	else
	{
		show_debug_message("returned false")
		instance_create_depth(o_mouse.cam_pos_x+1280/2,room_height/2,depth-5,o_save_wrong)
	}
			
		
}


if (timer>0)
{
	timer=0
	ready=false
	audio_stop_all()
	instance_destroy(o_note)
	for (i=0;i<array_length(note_recive_arr);i++)
	{
		var temp_note =	instance_create_layer(mouse_x,mouse_y,"notes",o_note);
		with (temp_note)
		{
			var _arr = o_import_code_handler.note_recive_arr[other.i]
			if _arr[0]==0 {note_index=6}
			else {note_index=_arr[0]/10000}
			max_gain=_arr[1]/10000
			base_atkk_speed=_arr[2]/10000
			base_release_speed=_arr[3]/10000
			pitch_amt=_arr[4]/10000
			my_text=_arr[5]
			image_xscale=_arr[6]
			x=_arr[7]
			y=_arr[8]
			my_snd=my_snd_arr[note_index]
			if place_meeting(x,y,o_note_creator) {instance_destroy(temp_note)}
		}
	}
}

if keyboard_check_pressed(vk_enter)
{
	get_text=false
	try_load=true
	my_text=keyboard_string
}

if keyboard_check(vk_control) && keyboard_check_pressed(ord("V"))
{
	keyboard_string=clipboard_get_text()
}

if get_text==true
{
	draw_set_font(Font_Notes_show_30)
	draw_set_colour(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(o_mouse.cam_pos_x+1280/2,room_height/2,"Paste your code here and press enter when done:")
	draw_text(o_mouse.cam_pos_x+1280/2,room_height/2+35,keyboard_string)
}