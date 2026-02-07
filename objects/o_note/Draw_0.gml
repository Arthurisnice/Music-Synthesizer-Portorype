if o_aintr_ctrl.show_arr[0]==true  && note_index==0
{
	draw_set_alpha(0.1)
	_org_alpha=0.1
}
else if o_aintr_ctrl.show_arr[1]==true  && note_index==1
{
	draw_set_alpha(0.1)
	_org_alpha=0.1
}
else if o_aintr_ctrl.show_arr[2]==true  && note_index==2
{
	draw_set_alpha(0.1)
	_org_alpha=0.1
}
else if o_aintr_ctrl.show_arr[3]==true  && note_index==3
{
	draw_set_alpha(0.1)
	_org_alpha=0.1
}
else if o_aintr_ctrl.show_arr[4]==true  && note_index==4
{
	draw_set_alpha(0.1)
	_org_alpha=0.1
}
else if o_aintr_ctrl.show_arr[5]==true  && note_index==5
{
	draw_set_alpha(0.1)
	_org_alpha=0.1
}
else {draw_set_alpha(1); _org_alpha=1}

if selected==true && selected_in_zone==false 
{
	draw_line_colour(x+sprite_width/2,y,menu_id.x+3,menu_id.y+3,c_white,c_white)
}

var scale=0.7
var text = string_replace(string(my_snd),"ref sound x_note_","")
var x_size = image_xscale
var y_size = image_yscale

switch(text)
{
	case 7:
		color=c_maroon
		break;
		
	case 2:
		color=c_blue
		break;
		
	case 3:
		color=c_fuchsia
		break;
		
	case 4:
		color=c_yellow
		break;
		
	case 5:
		color=c_green
		break;
		
	case 6:
		color=c_white
		break;
}
draw_sprite_ext(s_notes,0,x,y,x_size,y_size,0,color,_org_alpha)

//sellection code to handle stretching notes ============================================
var left_edge = x
var right_edge = x+sprite_width
var top = y-sprite_height/2
var bottom = y+sprite_height/2

if place_meeting(x,y,o_mouse) && o_mouse.prioraty!=id && selected==false && off_mouse==0  && !place_meeting(x,y,o_note_configurer) && !place_meeting(x,y,o_note) && point_in_rectangle(o_mouse.x,o_mouse.y,x,y-sprite_height/2,right_edge+2,bottom) && selected_in_zone==false
	{
		draw_sprite_ext(s_notes,0,x,y,x_size,y_size,0,c_black,0.5)
		o_mouse.image_index=5
		if mouse_check_button_pressed(mb_left) && selected_in_zone==false  && !point_in_rectangle(x,y,o_mouse.start_x,o_mouse.start_y,o_mouse.final_x,o_mouse.final_y) {selected=true; o_mouse.selectee=id}
		else if mouse_check_button_pressed(mb_right) && selected_in_zone==false && !point_in_rectangle(x,y,o_mouse.start_x,o_mouse.start_y,o_mouse.final_x,o_mouse.final_y)  {o_mouse.image_index=0;selected=false;selected_id=0;o_mouse.selectee=0; audio_stop_sound(my_snd);instance_destroy()}
	}
if (place_meeting(x,y,o_mouse) or selected==true) && off_mouse==0 && o_mouse.prioraty!=id && selected_in_zone==false
	{
		if keyboard_check_pressed(ord("C")) && o_mouse.selecting_zone==false
		{
			o_mouse.copy=true
			o_mouse.note_val=note_index
			o_mouse.nt_max_gain=max_gain
			o_mouse.nt_release_speed=release_speed
			o_mouse.nt_attack_speed=attack_speed
			o_mouse.nt_pitch_amt=pitch_amt
			o_mouse.nt_scale=image_xscale
			o_mouse.nt_letter=my_text
		}
	}
	
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var width_s = left==true ? sprite_get_width(s_notes): sprite_get_width(s_notes)*-1;
if mouse_check_button_pressed(mb_left) && held==true && off_mouse==0 && o_mouse.prioraty!=id && !place_meeting(x-width_s/2,y,o_note) {counter++}
//end of stretch code _____________________________________________________________			


draw_set_colour(c_red)
if _org_alpha>=1 {draw_set_alpha(0.3)}
else {draw_set_alpha(0)}

//displays the attack amount
var w_tri_attk = (max_gain/attack_speed)*2
if attack_speed<1 
{
	draw_triangle(x,y-sprite_height/2,x,y+sprite_height/2,x+w_tri_attk,y,false)
}

draw_set_colour(c_blue)

//displays the release amount
var w_tri_reles =  w_tri_attk<sprite_width? (max_gain/release_speed)*2 : abs((w_tri_attk-sprite_width)-((max_gain/release_speed)*2));
if release_speed<1 
{
	draw_triangle(x+sprite_width,y-sprite_height/2,x+sprite_width,y+sprite_height/2,x+sprite_width+w_tri_reles,y,false)
}
draw_set_alpha(_org_alpha)


draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_black)
var t_color = note_index!=5 ? (c_white):  (c_black);
draw_set_colour(t_color)
draw_set_font(Font_Notes_Type_12)
if my_text=="PENIS" {draw_sprite_ext(s_notes_custom,0,x+sprite_width/2,y,1,1,0,c_white,_org_alpha)} 
else  {draw_text(x+(sprite_width/2),y,my_text)}


draw_set_colour(c_white)

draw_set_halign(fa_left)
draw_set_valign(fa_top)

if o_mouse.debugg==1 or o_mouse.debugg==2
{
draw_text(x, y+40,
	"sound_txt: " + string(string_replace(string(my_snd),"ref sound x_note_","")) + "\n" +
    "note_play: " + string(note_play) + "\n" +
    "is_playing: " + string(is_playing) + "\n" +
    "curent_gain: " + string(curent_gain) + "\n" +
    "max_gain: " + string(max_gain) + "\n" +
    "target_gain: " + string(target_gain) + "\n" +
    "sound_id: " + string(sound_id) + "\n" +
    "finish: " + string(finish) + "\n" +
    "steps: " + string(steps) + "\n" +
    "release_speed: " + string(release_speed) + "\n" +
    "attack_speed: " + string(attack_speed) + "\n" +
    "milliseconds: " + string(milliseconds) + "\n" +
	"index: " + string(note_index) + "\n" +
	"selected_in_zone: " + string(selected_in_zone) + "\n" +
	"selected: " + string(selected) + "\n" +
    "pitch_amt: " + string(pitch_amt)
);
}


if place_meeting(x,y,o_note) or place_meeting(x,y,o_note_creator)
{
	o_mouse.touching=true
}
else {o_mouse.touching=false}

draw_set_alpha(1)

if selected_in_zone==true
{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_aqua,0.5)
}

if place_meeting(x,y,o_note)
{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_red,1)
}


if o_mouse.moving_zone==false && o_mouse.selecting_zone==true && place_meeting(x,y,o_mouse)
{
		var x_size_mv = image_xscale
		var y_size_mv = image_yscale
		draw_sprite_ext(s_notes,0,x,y,x_size_mv,y_size_mv,0,c_black,0.5)
		
		if selected_in_zone==true && place_meeting(x,y,o_mouse)  {o_mouse.image_index=8}
		else if selected_in_zone==false && o_mouse.note_colision==false && place_meeting(x,y,o_mouse) {o_mouse.image_index=7}

		
		if mouse_check_button_pressed(mb_left) && selected_in_zone==false && o_mouse.note_colision==false {array_push(o_mouse.selected_array,id); selected_in_zone=true}
		else if mouse_check_button_pressed(mb_right) && selected_in_zone==true 
		{
			
			var _f = function(_element, _index)
			{
			    return (_element == id);
			}
			var _arr_pos = array_find_index(o_mouse.selected_array,_f)
			

			array_delete(o_mouse.selected_array,_arr_pos,1)

			selected_in_zone=false
			
			if array_length(o_mouse.selected_array)<1 {o_mouse.selecting_zone=false}
		}
}

