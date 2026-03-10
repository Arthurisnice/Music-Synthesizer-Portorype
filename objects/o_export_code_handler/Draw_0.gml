if place_meeting(x,y,o_mouse) {draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_gray,image_alpha)}
else {draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)}


if try_save==true && instance_exists(o_note) && o_mouse.note_colision==false  && o_mouse.touching==false
{
	image_xscale=image_xscale+0.1
	image_yscale=image_yscale+0.1
	o_mouse.selecting_zone=false
	try_save=false
	notes_exit_arr=[]
	var temp_arr = array_create(0)
	var n_amt = instance_number(o_note)
	for (i=0;i<n_amt;i++)
	{
		temp_arr[i]=instance_find(o_note,i)
	}
	show_debug_message(temp_arr)
	
	for (var g=0;g<array_length(temp_arr);g++)
	{
		var note_arr_temp = array_create(0)
		var note_of = temp_arr[g]
		
		array_push(note_arr_temp,note_of.note_index*10000)
		array_push(note_arr_temp,note_of.max_gain*10000)
		array_push(note_arr_temp,note_of.base_atkk_speed*10000)
		array_push(note_arr_temp,note_of.base_release_speed*10000)
		array_push(note_arr_temp,note_of.pitch_amt*10000)
		array_push(note_arr_temp,note_of.my_text)
		array_push(note_arr_temp,note_of.image_xscale)
		array_push(note_arr_temp,note_of.x)
		array_push(note_arr_temp,note_of.y)
		array_push(notes_exit_arr,note_arr_temp)
		show_debug_message("============<>============\nRun #"+string(g)+": "+string(note_arr_temp))

	}
	show_debug_message("////////////////////////\n\n"+string(notes_exit_arr)+"\n\n/////////////////////////")
		
	var my_struct=
	{
		notes_array:notes_exit_arr,
		bpm:o_note_creator.bpm
	}
	
	
			// 1. Minify the JSON
		var struct_json = json_stringify(my_struct,false)
		show_debug_message("__________PRE COMRPESSION_____________")
		show_debug_message(struct_json)
		// 1. Clean the data (Force 3 decimals everywhere)
		var _clean_struct = scr_json_sanitize(my_struct);

		// 2. Stringify (Minified)
		var _json_string = json_stringify(_clean_struct, false);

		// 2. Put it in a buffer
		var _size = string_byte_length(_json_string);
		var _buff = buffer_create(_size, buffer_fixed, 1);
		buffer_write(_buff, buffer_text, _json_string);

		// 3. Compress it (Zlib)
		var _compressed_buff = buffer_compress(_buff, 0, _size);

		// 4. Convert the binary to a Base64 string (Clipboard-safe text)
		var _final_string = buffer_base64_encode(_compressed_buff, 0, buffer_get_size(_compressed_buff));

		// 5. Send to clipboard
		clipboard_set_text(_final_string);
		
		text_timer=100

		// Cleanup
		buffer_delete(_buff);
		buffer_delete(_compressed_buff);
	

}
else if try_save==true && !instance_exists(o_note) && o_mouse.note_colision==false && o_mouse.touching==false
{
	try_save=false
}

if place_meeting(x,y,o_mouse) && instance_exists(o_note) && o_mouse.note_colision==false && o_mouse.touching==false && mouse_check_button_pressed(mb_left)
{
	image_xscale=image_xscale-0.1
	image_yscale=image_yscale-0.1
	try_save=true
}

if text_timer>0
{
	draw_set_font(Font_Notes_show_30)
	draw_set_colour(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(o_mouse.cam_pos_x+1280/2,room_height/2,"Code pasted on your clipboard!")
	text_timer--
}


/*

if keyboard_check_pressed(ord("H"))
{

	var _b64_string = clipboard_get_text();
    
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
			var _arr = o_export_code_handler.note_recive_arr[other.i]
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
*/