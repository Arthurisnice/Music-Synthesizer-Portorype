if add_to_array==true
{
	add_to_array=false
	show_debug_message("step one completed")
	if instance_exists(o_note)
	{
		show_debug_message("step two completed")
		temp_move_arr=[]
		add_to_array=false
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
			array_push(note_arr_temp,note_of.base_atkk_speed)
			array_push(note_arr_temp,note_of.base_release_speed)
			array_push(note_arr_temp,note_of.pitch_amt)
			array_push(note_arr_temp,note_of.my_text)
			array_push(note_arr_temp,note_of.image_xscale)
			array_push(note_arr_temp,note_of.x)
			array_push(note_arr_temp,note_of.y)
			array_push(temp_move_arr,note_arr_temp)
			show_debug_message("============<>============\nRun #"+string(g)+": "+string(note_arr_temp))
	
		}
		array_push(notes_arr,temp_move_arr)
	}
	else
	{
		array_push(notes_arr,[])
	}
	show_debug_message("Array of saves: "+string(temp_move_arr))
	show_debug_message("Total  Array of saves("+string(array_length(notes_arr))+"): "+string(notes_arr))
	show_debug_message("Total  Array of saves last pos ("+string(array_length(notes_arr))+"): "+string(notes_arr[array_length(notes_arr)-1]))
}
if array_length(notes_arr)>arrayt_max_leng
{
	array_delete(notes_arr,0,1)
	show_debug_message("Array of saves ("+string(array_length(notes_arr))+"): "+string(notes_arr))
}




if keyboard_check(vk_control) && keyboard_check_pressed(ord("Z")) && array_length(notes_arr)>0 
{
	with(o_mouse)
	{
		selecting_zone=false
		moving_zone=false
		start_x=0
		start_y=0
		final_x=0
		final_y=0
	}
	if instance_exists(o_note) {instance_destroy(o_note)}
	my_last=[]
	var temp_arr = array_reverse(notes_arr)

	var amt = 1
	var max_t = clamp((array_length(notes_arr)-1),0,999)
	
	amt=clamp(amt,0,max_t)
	
	my_last=temp_arr[amt]
	
	temp_arr=[]
	
		for (i=0;i<array_length(my_last);i++)
		{
			var temp_note =	instance_create_layer(mouse_x,mouse_y,"notes",o_note);
			with (temp_note)
			{
				var _arr = o_undo_controller.my_last[other.i]
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
				if place_meeting(x,y,o_note_creator) or place_meeting(x,y,o_note) {instance_destroy(temp_note)}
			}
		}
		array_pop(notes_arr)
}
