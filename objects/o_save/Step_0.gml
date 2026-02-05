if try_save==true && instance_exists(o_note)
{
	try_save=false
	image_angle+=side
	cnt=1
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
		
		array_push(note_arr_temp,note_of.note_index)
		array_push(note_arr_temp,note_of.max_gain)
		array_push(note_arr_temp,note_of.attack_speed)
		array_push(note_arr_temp,note_of.release_speed)
		array_push(note_arr_temp,note_of.pitch_amt)
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
		notes_array:notes_exit_arr
	}
	
	var struct_json = json_stringify(my_struct,false)
	
	var _file = file_text_open_write("struct_as_json.json")
	file_text_write_string(_file, struct_json)
	file_text_close(_file)
	show_debug_message("(>>\nSAVED JSON-\n"+string(struct_json)+"\n<<)")
}
else if try_save==true && !instance_exists(o_note)
{
	try_save=false
}

if try_load==true
{
	try_load=false
	note_recive_arr=[]
	if file_exists("struct_as_json.json")
	{
		var _loaded_file = file_text_open_read("struct_as_json.json");
            var _temp_vbuff_list = "";
            while (!file_text_eof(_loaded_file))
                {
                    _temp_vbuff_list += file_text_read_string(_loaded_file);
                    file_text_readln(_loaded_file);
                }
            file_text_close(_loaded_file);    delete(_loaded_file);
			
			var text = json_parse(_temp_vbuff_list)
			var notes_array_temp = array_create(1,text.notes_array)
			for (var l=0;l<array_length(notes_array_temp[0]);l++)
			{
				note_recive_arr[l]=notes_array_temp[0][l]
			}
			show_debug_message("(>>\LOADED JSON-\n"+string(note_recive_arr)+"\n<<)")
	}
	timer=120
}

if cnt>=1
{
	image_angle+=side
	cnt++
	if cnt>=36 
	{
		cnt=0
		image_angle=0
	}
}