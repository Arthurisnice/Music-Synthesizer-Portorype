if selected==true
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
		color=c_fuchsia
		break;
		
	case 2:
		color=c_orange
		break;
		
	case 3:
		color=c_yellow
		break;
		
	case 4:
		color=c_green
		break;
		
	case 5:
		color=c_blue
		break;
		
	case 6:
		color=c_purple
		break;
}
draw_sprite_ext(s_notes,0,x,y,x_size,y_size,0,color,1)

//sellection code
var left_edge = x
var right_edge = x+sprite_width
var top = y-sprite_height/2
var bottom = y+sprite_height/2

if place_meeting(x,y,o_mouse) && o_mouse.prioraty!=id && selected==false && off_mouse==0  && !place_meeting(x,y,o_note_configurer) && !place_meeting(x,y,o_note) && point_in_rectangle(o_mouse.x,o_mouse.y,x,y-sprite_height/2,right_edge+2,bottom)
	{
		draw_sprite_ext(s_notes,0,x,y,x_size,y_size,0,c_black,0.5)
		o_mouse.image_index=5
		if mouse_check_button_pressed(mb_left) {selected=true; o_mouse.selectee=id}
		else if mouse_check_button_pressed(mb_right) {o_mouse.image_index=0;selected=false;selected_id=0;o_mouse.selectee=0;instance_destroy()}
	}
if (place_meeting(x,y,o_mouse) or selected==true) && off_mouse==0 && o_mouse.prioraty!=id
	{
		if keyboard_check_pressed(ord("C"))
		{
			o_mouse.copy=true
			o_mouse.note_val=note_index
			o_mouse.nt_max_gain=max_gain
			o_mouse.nt_release_speed=release_speed
			o_mouse.nt_attack_speed=attack_speed
			o_mouse.nt_pitch_amt=pitch_amt
			o_mouse.nt_scale=image_xscale
		}
	}

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var width_s = left==true ? sprite_get_width(s_notes): sprite_get_width(s_notes)*-1;
if mouse_check_button_pressed(mb_left) && held==true && off_mouse==0 && o_mouse.prioraty!=id && !place_meeting(x-width_s/2,y,o_note) {counter++}
				
draw_set_colour(c_red)
draw_set_alpha(0.3)

var w_tri_attk = (max_gain/attack_speed)*2
if attack_speed<1 
{
	draw_triangle(x,y-sprite_height/2,x,y+sprite_height/2,x+w_tri_attk,y,false)
}

draw_set_colour(c_blue)

var w_tri_reles =  w_tri_attk<sprite_width? (max_gain/release_speed)*2 : abs((w_tri_attk-sprite_width)-((max_gain/release_speed)*2));
if release_speed<1 
{
	draw_triangle(x+sprite_width,y-sprite_height/2,x+sprite_width,y+sprite_height/2,x+sprite_width+w_tri_reles,y,false)
}
draw_set_alpha(1)
draw_set_colour(c_white)

draw_set_halign(fa_left)
draw_set_valign(fa_top)

if o_mouse.debugg==true
{
draw_text(x, y+40,
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
    "pitch_amt: " + string(pitch_amt)
);
}


