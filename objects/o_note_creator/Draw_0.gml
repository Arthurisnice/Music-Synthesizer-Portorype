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
			var multiplyer = 1.20
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

//PAUSE BUTTOM CODE__________________________

var pause_sprite_w = sprite_get_width(s_on_off)
var pause_sprite_h = sprite_get_height(s_on_off)
var pause_pos_x= 10+pause_sprite_w/2
var pause_pos_y= 10+pause_sprite_h/2

var pause_scale=1

if (keyboard_check_pressed(vk_space) && paused==false) or (point_in_rectangle(o_mouse.x,o_mouse.y,pause_pos_x-pause_sprite_w/2,pause_pos_y-pause_sprite_h/2,pause_pos_x+pause_sprite_w/2,pause_pos_y+pause_sprite_h/2) && mouse_check_button_pressed(mb_left) && paused==false)
{
	pause_scale=0.9
	paused=true
	pos_x=round(pos_x)
}
else if (keyboard_check_pressed(vk_space) && paused==true) or (point_in_rectangle(o_mouse.x,o_mouse.y,pause_pos_x-pause_sprite_w/2,pause_pos_y-pause_sprite_h/2,pause_pos_x+pause_sprite_w/2,pause_pos_y+pause_sprite_h/2) && mouse_check_button_pressed(mb_left) && paused==true)
{
	pause_scale=0.9
	paused=false
	if instance_exists(o_note) {o_note.recalculate=true}
}

if pause_scale!=1
{
	pause_scale+=0.01
}

var on_off_state = (paused==false) ? 0: 1;

draw_sprite_ext(s_on_off,on_off_state,pause_pos_x,pause_pos_y,pause_scale,pause_scale,0,c_white,1)

//RESET BUTTOM CODE_____________________

var reset_sprite_w = sprite_get_width(s_stop)
var reset_sprite_h = sprite_get_height(s_stop)
var reset_pos_x= 78+reset_sprite_w/2
var reset_pos_y= 24+reset_sprite_h/2

var reset_scale=1

//draw_rectangle(reset_pos_x-reset_sprite_w/2,reset_pos_y-reset_sprite_h/2,reset_pos_x+reset_sprite_w/2,reset_pos_y+reset_sprite_h/2,true)

if (keyboard_check_pressed(ord("R"))) or (point_in_rectangle(o_mouse.x,o_mouse.y,reset_pos_x-reset_sprite_w/2,reset_pos_y-reset_sprite_h/2,reset_pos_x+reset_sprite_w/2,reset_pos_y+reset_sprite_h/2) && mouse_check_button_pressed(mb_left))
{
	reset_scale=0.9
	pos_x=-10
	paused=true
}


if reset_scale!=1
{
	reset_scale+=0.01
}

draw_sprite_ext(s_stop,0,reset_pos_x,reset_pos_y,reset_scale,reset_scale,0,c_white,1)

//Mouse Handler -Disabled for now

/*
if point_in_rectangle(o_mouse.x,o_mouse.y,pause_pos_x-pause_sprite_w/2,pause_pos_y-pause_sprite_h/2,pause_pos_x+pause_sprite_w/2,pause_pos_y+pause_sprite_h/2) or (point_in_rectangle(o_mouse.x,o_mouse.y,reset_pos_x-reset_sprite_w/2,reset_pos_y-reset_sprite_h/2,reset_pos_x+reset_sprite_w/2,reset_pos_y+reset_sprite_h/2))
{
	o_mouse.image_index=6
}
else if o_mouse.selectee==0 {o_mouse.image_index=0}
*/
if timer>0 {timer--}

//draw_text(mouse_x,mouse_y,pos_x)

//draw_text(room_width-180,20,"timer: "+string(timer)+"\n"+"moved: "+string(final_move))