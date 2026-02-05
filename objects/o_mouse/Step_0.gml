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
			if o_mouse.note_val==0 {o_mouse.note_val=6}
			if o_mouse.prioraty!=0 {audio_stop_all() ;instance_destroy(o_mouse.prioraty)}
			var temp_note =	instance_create_layer(mouse_x,mouse_y,"notes",o_note);
			o_mouse.prioraty=temp_note.id
			temp_note.my_snd=temp_note.my_snd_arr[o_mouse.note_val]
			temp_note.temp_sound = audio_play_sound(temp_note.my_snd_arr[o_mouse.note_val],0,true,o_mouse.nt_max_gain,0,o_mouse.nt_pitch_amt)
			temp_note.alarm[0]=10
			temp_note.note_index=o_mouse.note_val
			o_mouse.selectee=0
			o_note.selected=false
			with(temp_note)
			{
				max_gain=o_mouse.nt_max_gain
				release_speed=o_mouse.nt_release_speed
				attack_speed=o_mouse. nt_attack_speed
				pitch_amt=o_mouse.nt_pitch_amt
				image_xscale=o_mouse.nt_scale
				my_text=o_mouse.nt_letter
				note_index=o_mouse.note_val
			}
	}
	copy=false
}

if keyboard_check_pressed(ord("C")) && selecting_zone==true
{
	nt_data=[]
	var dist_arr_x = array_create(0)
	var dist_arr_y = array_create(0)
	for (i=0;i<array_length(selected_array);i++)
	{
		var dist_x = selected_array[i].x-selected_array[0].x
		var dist_y = selected_array[i].y-selected_array[0].y
		array_push(dist_arr_x,dist_x)
		array_push(dist_arr_y,dist_y)
	}
	

	
	for (i=0;i<array_length(selected_array);i++)
	{
		var temp_arr = array_create(0)
		temp_arr[0]=true
		temp_arr[1]=selected_array[i].note_index
		temp_arr[2]=selected_array[i].max_gain
		temp_arr[3]=selected_array[i].release_speed
		temp_arr[4]=selected_array[i].attack_speed
		temp_arr[5]=selected_array[i].pitch_amt
		temp_arr[6]=selected_array[i].image_xscale
		temp_arr[7]=selected_array[i].my_text
		temp_arr[8]=true
		
		with (o_note_creator) {paused=true}
		if temp_arr[1]==0 {temp_arr[1]=6}
		var temp_note =	instance_create_layer(mouse_x+dist_arr_x[i],mouse_y+dist_arr_y[i]+12,"notes",o_note);
		temp_note.my_snd=temp_note.my_snd_arr[temp_arr[1]]
		temp_note.note_index=temp_arr[1]
		o_mouse.selectee=0
		o_note.selected=false
		with(temp_note)
		{
			max_gain=temp_arr[2]
			release_speed=temp_arr[3]
			attack_speed=temp_arr[4]
			pitch_amt=temp_arr[5]
			image_xscale=temp_arr[6]
			my_text=temp_arr[7]
			note_index=temp_arr[1]
			x=get_closest_val(o_note_creator.grid_x_arr,x)
			y=get_closest_val(o_note_creator.grid_y_arr,y)
		}
		array_push(nt_data,temp_note.id)
	}
	var x_arr_val = array_create(0)
	var y_arr_val = array_create(0)
	var long_val = 0
	var pos_val = 0
	for (var j=0; j<array_length(nt_data);j++)
	{
		if nt_data[j].x>long_val {long_val=nt_data[j].x; pos_val=j}
		array_push(x_arr_val,nt_data[j].x)
		array_push(y_arr_val,nt_data[j].y)
	}
	array_sort(x_arr_val,true)
	array_sort(y_arr_val,true)
	start_x=x_arr_val[0]-30
	start_y=y_arr_val[0]-60
	final_x=x_arr_val[array_length(x_arr_val)-1]+30+(40*nt_data[pos_val].image_xscale)
	final_y=y_arr_val[array_length(y_arr_val)-1]+60
	
	for (var l=0; l<array_length(selected_array);l++)
	{
		selected_array[l].selected_in_zone=false
		selected_array[l]=nt_data[l]
		selected_array[l].selected_in_zone=true
	}

}