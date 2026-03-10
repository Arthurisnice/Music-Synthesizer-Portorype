draw_self()

/*
8/39
35/49

39/39
62/49

66/39
89/49

93/39
121/49


7/52
63/75

65/52
122/74


draw_rectangle(x+8,y+39,x+35,y+49,false)
draw_rectangle(x+39,y+39,x+62,y+49,false)
draw_rectangle(x+66,y+39,x+89,y+49,false)
draw_rectangle(x+93,y+39,x+121,y+49,false)
*/

var bpm_to=o_note_creator.bpm

//REDUCES BPM BY 30
if point_in_rectangle(o_mouse.x,o_mouse.y,x+8,y+39,x+35,y+49) && mouse_check_button_pressed(mb_left)
{
		var temp_ints = instance_create_depth(x,y,o_bpm_controller.depth-5,o_bpm_buttons)
		temp_ints.image_index=2
		bpm_to-=30
}

//REDUCES BPM BY 310
if point_in_rectangle(o_mouse.x,o_mouse.y,x+39,y+39,x+62,y+49) && mouse_check_button_pressed(mb_left)
{
		var temp_ints = instance_create_depth(x,y,o_bpm_controller.depth-5,o_bpm_buttons)
		temp_ints.image_index=3
		bpm_to-=10
}	

//INCREASES BPM BY 10
if point_in_rectangle(o_mouse.x,o_mouse.y,x+66,y+39,x+89,y+49) && mouse_check_button_pressed(mb_left)
{
		var temp_ints = instance_create_depth(x,y,o_bpm_controller.depth-5,o_bpm_buttons)
		temp_ints.image_index=4
		bpm_to+=10
}

//INCREASES BPM BY 30
if point_in_rectangle(o_mouse.x,o_mouse.y,x+93,y+39,x+121,y+49) && mouse_check_button_pressed(mb_left)
{
		var temp_ints = instance_create_depth(x,y,o_bpm_controller.depth-5,o_bpm_buttons)
		temp_ints.image_index=5
		bpm_to+=30
}

o_note_creator.bpm=clamp(bpm_to,10,300)

draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_colour(c_black)
draw_set_font(Font_Notes_show_small_20)

draw_text(x+sprite_width/2,y+22,o_note_creator.bpm)

draw_set_colour(c_white)
//draw_rectangle(x+7,y+52,x+63,y+75,false)
//draw_rectangle(x+64,y+52,x+122,y+75,false)

