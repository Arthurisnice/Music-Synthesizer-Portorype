//GRID DRAW CODE_____________________________


var grid_x_leng = array_length(grid_x_arr)

for (i=0;i<grid_x_leng;i++)
{
	draw_set_alpha(0.3)
	draw_line_width_colour(grid_x_arr[i],0,grid_x_arr[i],room_width,1,c_gray,c_gray)
}

var grid_y_leng = array_length(grid_y_arr)

for (i=0;i<grid_y_leng;i++)
{
 
	draw_line_width_colour(0,grid_y_arr[i],room_width,grid_y_arr[i],1,c_gray,c_gray)
}

draw_set_alpha(1)

//Play Line Code___________________________

draw_self()


if keyboard_check_direct(ord("S"))
{
	pos_x=-10
	start=true
}

if pos_x!= room_width
	{
		//draw_line_width_colour(pos_x,0+sprite_height,pos_x,room_height,3,c_yellow,c_yellow)
		if paused==false
		{
			var multiplyer = (sprite_get_width(s_notes)*(o_note_creator.bpm/60))/60
			pos_x+=multiplyer
			pos_x = (round(pos_x * 100) / 100)
			if final_move < 5.25 {final_move+=multiplyer}
			else 
			{	
				pos_x=round(pos_x)
				final_move=0
			}
			final_move = (round(final_move * 100) / 100)
		}
	}
if pos_x>=room_width {pos_x=0; start=false}

var pos_x_bpm=o_bpm_controller.x
var pos_y_bpm=o_bpm_controller.y

//PAUSE BUTTOM CODE__________________________

var pause_sprite_w = sprite_get_width(s_on_off)
var pause_sprite_h = sprite_get_height(s_on_off)
var pause_pos_x= 10+pause_sprite_w/2
var pause_pos_y= 10+pause_sprite_h/2

var pause_scale=1

if (keyboard_check_pressed(vk_space) && paused==false) or (point_in_rectangle(o_mouse.x,o_mouse.y,pos_x_bpm+7,pos_y_bpm+52,pos_x_bpm+63,pos_y_bpm+75) && mouse_check_button_pressed(mb_left) && paused==false)
{
	var temp_ints = instance_create_depth(pos_x_bpm,pos_y_bpm,o_bpm_controller.depth-5,o_bpm_buttons)
	temp_ints.image_index=6
	pause_scale=0.9
	paused=true
	pos_x=round(pos_x)
}
else if (keyboard_check_pressed(vk_space) && paused==true) or (point_in_rectangle(o_mouse.x,o_mouse.y,pos_x_bpm+7,pos_y_bpm+52,pos_x_bpm+63,pos_y_bpm+75) && mouse_check_button_pressed(mb_left) && paused==true)
{
	var temp_ints = instance_create_depth(pos_x_bpm,pos_y_bpm,o_bpm_controller.depth-5,o_bpm_buttons)
	temp_ints.image_index=7
	pause_scale=0.9
	paused=false
	if instance_exists(o_note) {o_note.recalculate=true}
}

if pause_scale!=1
{
	pause_scale+=0.01
}



//draw_sprite_ext(s_controls,on_off_state,pos_x_bpm,pos_y_bpm,pause_scale,pause_scale,0,c_white,1)

//RESET BUTTOM CODE_____________________

var reset_sprite_w = sprite_get_width(s_stop)
var reset_sprite_h = sprite_get_height(s_stop)
var reset_pos_x= 78+reset_sprite_w/2
var reset_pos_y= 24+reset_sprite_h/2

var reset_scale=1

//draw_rectangle(reset_pos_x-reset_sprite_w/2,reset_pos_y-reset_sprite_h/2,reset_pos_x+reset_sprite_w/2,reset_pos_y+reset_sprite_h/2,true)

if (keyboard_check_pressed(ord("R"))) or (point_in_rectangle(o_mouse.x,o_mouse.y,pos_x_bpm+64,pos_y_bpm+52,pos_x_bpm+122,pos_y_bpm+75) && mouse_check_button_pressed(mb_left))
{
	var temp_ints = instance_create_depth(pos_x_bpm,pos_y_bpm,o_bpm_controller.depth-5,o_bpm_buttons)
	temp_ints.image_index=8
	reset_scale=0.9
	pos_x=-10
	paused=true
}


if reset_scale!=1
{
	reset_scale+=0.01
}

//draw_sprite_ext(s_controls,0,pos_x_bpm,pos_y_bpm,reset_scale,reset_scale,0,c_white,1)

if timer>0 {timer--}

//draw_text(mouse_x,mouse_y,pos_x)

//draw_text(room_width-180,20,"timer: "+string(timer)+"\n"+"moved: "+string(final_move))