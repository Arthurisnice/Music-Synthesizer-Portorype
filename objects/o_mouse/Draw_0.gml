if o_mouse.prioraty!=0  && touching==true
{
		color=c_red
}
else {color=c_white}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,1)

color=c_white

if keyboard_check(ord("D")) && keyboard_check(ord("B")) && keyboard_check_pressed(ord("G"))
{
	debugg++
}
if debugg>max_dbg {debugg=0}


if debugg>0
{
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_font(Font_Notes_Type_12)
	draw_set_colour(c_red)
	draw_text(10,10,"Debbug ON / "+ string(debugg))
	draw_set_colour(c_white)
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)

if debugg==1 or debugg==3
{
	var test = "teste"
	var _note = place_meeting(x,y,o_note) ? "yes": "no";
	var _creator = place_meeting(x,y,o_note_creator) ? "yes": "no";
	var _configurator = place_meeting(x,y,o_note_configurer) ? "yes": "no";
	var _rec = point_in_rectangle(x,y,start_x,start_y,final_x,final_y) ? "yes": "no";
	
	
	draw_text(x, y+15,
    "note_val: " + string(note_val) + "\n" +
	"prioraty: " + string(prioraty) + "\n" +
    "image_index: " + string(image_index) + "\n" +
    "offset_x: " + string(offset_x) + "\n" +
	"making_zone: " + string(making_zone) + "\n" +
	"selecting_zone: " + string(selecting_zone) + "\n" +
	"moving_zone: " + string(moving_zone) + "\n" +
	"on note: " + _note + "\n" +
	"on creator: " + _creator + "\n" +
	"on configurator: " + _configurator + "\n" +
	"on rectangle: " + _rec + "\n" +
	"start_x: " + string(start_x) + "\n" +
	"start_y: " + string(start_y) + "\n" +
	"final_x: " + string(final_x)+ "\n" +
	"final_y: " + string(final_y) + "\n" +
	"start_zone_x_offset: " + string(start_zone_x_offset) + "\n" +
	"start_zone_y_offset: " + string(start_zone_y_offset) + "\n" +
	"end_zone_x_offset: " + string(end_zone_x_offset)+ "\n" +
	"end_zone_y_offset: " + string(end_zone_y_offset) + "\n" +
	"note_coll: " + string(note_colision) + "\n" +
	"mune_id: " + string(menu_thing) + "\n" +
    "selectee: " + string(selectee)
);

}

//start selection
if !place_meeting(x,y,o_note_creator) && prioraty==0 && !place_meeting(x,y,o_note) && !place_meeting(x,y,o_note_configurer) && mouse_check_button_pressed(mb_left) && selecting_zone==false
{
	start_x=0
	start_y=0
	final_x=0
	final_y=0
	making_zone=true
	start_x=x
	start_y=y
	selected_array=[]
}
else if selecting_zone==true  //if you selected at least something
{
	if mouse_check_button_pressed(mb_left) && !point_in_rectangle(x,y,start_x,start_y,final_x,final_y) && !place_meeting(o_mouse.x,o_mouse.y,o_delete_notes) && !place_meeting(o_mouse.x,o_mouse.y,o_note_conf_zone) && note_colision==false
	{
		if instance_exists(o_note){ o_note.selected_in_zone=false}
		selecting_zone=false
		moving_zone=false
		start_x=0
		start_y=0
		final_x=0
		final_y=0
	}
	
	o_delete_notes.x=final_x
	o_delete_notes.y=start_y
	
	draw_set_alpha(0.1)
	draw_set_colour(c_aqua)
	
	if moving_zone==false {draw_rectangle(start_x,start_y,final_x,final_y,false)}
	
	
	draw_set_alpha(1)
	draw_set_colour(c_white)
}

//if you are selecting something
if making_zone==true && mouse_check_button(mb_left)
{
	draw_set_alpha(0.5)
	draw_set_colour(c_aqua)
	
	draw_rectangle(start_x,start_y,x,y,false)
	
	
	draw_set_alpha(1)
	draw_set_colour(c_white)
}


//when you are done trying to select
if making_zone==true && mouse_check_button_released(mb_left)
{
	var _selc_list = ds_list_create()
	
	selected_array=[]

	collision_rectangle_list(start_x,start_y,x,y,o_note,false,true,_selc_list,false)
	
	for (i = 0; i < ds_list_size(_selc_list); i++) {
		if _selc_list[| i]._org_alpha>0.1 
		{
			array_push(selected_array ,_selc_list[| i])
		} 
    }

	
	show_debug_message("list: "+string(selected_array)+"\n---\n")
	
	for (var l=0; l<array_length(selected_array);l++)
	{
		selected_array[l].selected_in_zone=true
	}
	
	if array_length(selected_array)>0 {selecting_zone=true}
	
	ds_list_destroy(_selc_list)
	
	final_x=x
	final_y=y
	
	if final_x<start_x 
	{
		var _svx = start_x
		start_x=final_x
		final_x=_svx
	}
	if final_y<start_y 
	{
		var _svy = start_y
		start_y=final_y
		final_y=_svy
	}
	
	making_zone=false
}

//moving stuff in the rectangle
if !place_meeting(x,y,o_note_creator) && !place_meeting(x,y,o_note_configurer) && mouse_check_button_pressed(mb_left) && selecting_zone==true && point_in_rectangle(x,y,start_x,start_y,final_x,final_y)
{
	moving_zone=true
	x_offeset_array=[]
	y_offeset_array=[]
	for (i=0; i<array_length(selected_array);i++)
	{
		x_offeset_array[i]=x-selected_array[i].x
		y_offeset_array[i]=y-selected_array[i].y
	}
	start_zone_x_offset=start_x-x
	start_zone_y_offset=start_y-y
	end_zone_x_offset=final_x-x
	end_zone_y_offset=final_y-y
	
	
}
if moving_zone==true && mouse_check_button(mb_left) 
{
		
	if x+end_zone_x_offset<room_width && x+start_zone_x_offset>0 && y+end_zone_y_offset<room_height && y+start_zone_y_offset>0+o_note_creator.sprite_height
	{
		saved_x=x
		saved_y=y
		
		o_delete_notes.x=x+end_zone_x_offset
		o_delete_notes.y=y+start_zone_y_offset
	
		draw_set_alpha(0.1)
		draw_set_colour(c_aqua)
	
		draw_rectangle(x+start_zone_x_offset,y+start_zone_y_offset,x+end_zone_x_offset,y+end_zone_y_offset,false)
		
	
		draw_set_alpha(1)
		draw_set_colour(c_white)
		
		
		for (var l=0; l<array_length(selected_array);l++)
		{
		
			selected_array[l].x=get_closest_val(o_note_creator.grid_x_arr,x-x_offeset_array[l])
			selected_array[l].y=get_closest_val(o_note_creator.grid_y_arr,y-y_offeset_array[l])-selected_array[l].sprite_height/2
		}
	}
	else
	{
		
		o_delete_notes.x=saved_x+end_zone_x_offset
		o_delete_notes.y=saved_y+start_zone_y_offset
	
		draw_set_alpha(0.1)
		draw_set_colour(c_aqua)
	
		draw_rectangle(saved_x+start_zone_x_offset,saved_y+start_zone_y_offset,saved_x+end_zone_x_offset,saved_y+end_zone_y_offset,false)
		
	
		draw_set_alpha(1)
		draw_set_colour(c_white)
		
	}
}
else if moving_zone==true && mouse_check_button_released(mb_left) && x+end_zone_x_offset<room_width && x+start_zone_x_offset>0 && y+end_zone_y_offset<room_height && y+start_zone_y_offset>0+o_note_creator.sprite_height
{
	moving_zone=false; 
	
	start_x=x+start_zone_x_offset
	start_y=y+start_zone_y_offset
	final_x=x+end_zone_x_offset
	final_y=y+end_zone_y_offset

	
	start_zone_x_offset=0
	start_zone_y_offset=0
	end_zone_x_offset=0
	end_zone_y_offset=0
}
else if moving_zone==true && mouse_check_button_released(mb_left)
{
	moving_zone=false; 
	
	start_x=saved_x+start_zone_x_offset
	start_y=saved_y+start_zone_y_offset
	final_x=saved_x+end_zone_x_offset
	final_y=saved_y+end_zone_y_offset

	
	start_zone_x_offset=0
	start_zone_y_offset=0
	end_zone_x_offset=0
	end_zone_y_offset=0
}
draw_text(x,y+15,o_note_creator.bpm)