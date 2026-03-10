draw_self()
var x_pos=65
var y_pos=15
var n_dist_y=17

draw_set_colour(c_white)

draw_set_font(Font_Note_Text_8)
draw_set_valign(fa_middle)
draw_set_halign(fa_bottom)

draw_text(x + x_pos, y + y_pos + (n_dist_y * 0), string_trim(string_format(gain_val, 1, 3)));
draw_text(x + x_pos, y + y_pos + (n_dist_y * 1), string_trim(string_format(attack_val, 1, 3)));
draw_text(x + x_pos, y + y_pos + (n_dist_y * 2), string_trim(string_format(release_val, 1, 3)));
draw_text(x + x_pos, y + y_pos + (n_dist_y * 3), string_trim(string_format(pitch_val, 1, 3)));

var x_offset=9
var y_offset=11
var dist_y=17
var dist_x=12
/*
//GAIN CODE
draw_rectangle(x+11+(dist_x*0),y+11+(dist_y*0),x+11+x_offset+(dist_x*0),y+11+y_offset+(dist_y*0),true)
draw_rectangle(x+11+(dist_x*1),y+11+(dist_y*0),x+11+x_offset+(dist_x*1),y+11+y_offset+(dist_y*0),true)

//ATTACK CODE
draw_rectangle(x+11+(dist_x*0),y+11+(dist_y*1),x+11+x_offset+(dist_x*0),y+11+y_offset+(dist_y*1),true)
draw_rectangle(x+11+(dist_x*1),y+11+(dist_y*1),x+11+x_offset+(dist_x*1),y+11+y_offset+(dist_y*1),true)

//RELEASE CODE
draw_rectangle(x+11+(dist_x*0),y+11+(dist_y*2),x+11+x_offset+(dist_x*0),y+11+y_offset+(dist_y*2),true)
draw_rectangle(x+11+(dist_x*1),y+11+(dist_y*2),x+11+x_offset+(dist_x*1),y+11+y_offset+(dist_y*2),true)

//PITCH CODE
draw_rectangle(x+11+(dist_x*0),y+11+(dist_y*3),x+11+x_offset+(dist_x*0),y+11+y_offset+(dist_y*3),true)
draw_rectangle(x+11+(dist_x*1),y+11+(dist_y*3),x+11+x_offset+(dist_x*1),y+11+y_offset+(dist_y*3),true)
*/

//freak ass code for adding and removing valeus
var c_x_offset=9
var c_y_offset=11
var c_dist_y=17
var c_dist_x=12

if keyboard_check_pressed(vk_shift) {amt++}
if amt>2 {amt=0}
o_mouse.last_shit=amt
var mult=0
var offset_x_amt = 67
if amt==0 {mult=0.001 ; draw_text(x+offset_x_amt,y+86,"0.001")}
else if amt==1 {mult=0.01 ; draw_text(x+offset_x_amt,y+86,"0.010")}
else if amt==2 {mult=0.1 ; draw_text(x+offset_x_amt,y+86,"0.100")}




//GAIN CODE
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*0),y+11+(c_dist_y*0),x+11+c_x_offset+(c_dist_x*0),y+11+c_y_offset+(c_dist_y*0)) && mouse_check_button_pressed(mb_left)
{
	gain_val+=mult
	var button = instance_create_depth(x,y+(c_dist_y*0),depth-2,o_note_button)
	button.image_index=1
}
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*1),y+11+(c_dist_y*0),x+11+c_x_offset+(c_dist_x*1),y+11+c_y_offset+(c_dist_y*0)) && mouse_check_button_pressed(mb_left)
{
	gain_val-=mult
	var button = instance_create_depth(x,y+(c_dist_y*0),depth-2,o_note_button)
	button.image_index=2
}

//ATTACK CODE
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*0),y+11+(c_dist_y*1),x+11+c_x_offset+(c_dist_x*0),y+11+c_y_offset+(c_dist_y*1)) && mouse_check_button_pressed(mb_left)
{
	attack_val+=mult
	var button = instance_create_depth(x,y+(c_dist_y*1),depth-2,o_note_button)
	button.image_index=1
}
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*1),y+11+(c_dist_y*1),x+11+c_x_offset+(c_dist_x*1),y+11+c_y_offset+(c_dist_y*1)) && mouse_check_button_pressed(mb_left)
{
	attack_val-=mult
	var button = instance_create_depth(x,y+(c_dist_y*1),depth-2,o_note_button)
	button.image_index=2
}

//RELEASE CODE
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*0),y+11+(c_dist_y*2),x+11+c_x_offset+(c_dist_x*0),y+11+c_y_offset+(c_dist_y*2)) && mouse_check_button_pressed(mb_left)
{
	release_val+=mult
	var button = instance_create_depth(x,y+(c_dist_y*2),depth-2,o_note_button)
	button.image_index=1
}
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*1),y+11+(c_dist_y*2),x+11+c_x_offset+(c_dist_x*1),y+11+c_y_offset+(c_dist_y*2)) && mouse_check_button_pressed(mb_left)
{
	release_val-=mult
	var button = instance_create_depth(x,y+(c_dist_y*2),depth-2,o_note_button)
	button.image_index=2
}

//PITCH CODE
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*0),y+11+(c_dist_y*3),x+11+c_x_offset+(c_dist_x*0),y+11+c_y_offset+(c_dist_y*3)) && mouse_check_button_pressed(mb_left)
{
	pitch_val+=mult
	var button = instance_create_depth(x,y+(c_dist_y*3),depth-2,o_note_button)
	button.image_index=1
}
if point_in_rectangle(o_mouse.x,o_mouse.y,x+11+(c_dist_x*1),y+11+(c_dist_y*3),x+11+c_x_offset+(c_dist_x*1),y+11+c_y_offset+(c_dist_y*3)) && mouse_check_button_pressed(mb_left)
{
	pitch_val-=mult
	var button = instance_create_depth(x,y+(c_dist_y*3),depth-2,o_note_button)
	button.image_index=2
}

//done code
//draw_rectangle(x+78,y+77,x+78+60,y+77+21,false)
if point_in_rectangle(o_mouse.x,o_mouse.y,x+78,y+77,x+78+60,y+77+21) && mouse_check_button_pressed(mb_left)
{
	var shape = instance_create_depth(x,y+(c_dist_y*0),depth-2,o_note_button)
	shape.image_index=5
	var button = instance_create_depth(x,y+(c_dist_y*0),depth-2,o_note_button)
	button.image_index=4
	done=true
}

gain_val=clamp(gain_val,-2,2)
attack_val=clamp(attack_val,-1,1)
release_val=clamp(release_val,-1,1)
pitch_val=clamp(pitch_val,-50,50)

if done==true
{
	o_undo_controller.add_to_array=true
	var arr_to_change = o_mouse.selected_array
	for (i=0;i<array_length(arr_to_change);i++)
	{
		var my_note = arr_to_change[i]
		my_note.max_gain=my_note.max_gain+gain_val
		my_note.base_atkk_speed=my_note.base_atkk_speed+attack_val
		my_note.base_release_speed=my_note.base_release_speed+release_val
		my_note.pitch_amt=my_note.pitch_amt+pitch_val
	}
	done=false
}


