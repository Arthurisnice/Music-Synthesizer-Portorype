draw_self()

if start==false
{
	draw_set_alpha(txt_alpha)
	draw_set_font(Font_Notes_show_small_20)
	draw_set_colour(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false)
	draw_text(room_width/2,room_height/2,"A software by Velha!")	
	draw_set_font(Font_Notes_Type_12)
	draw_text(room_width/2,room_height/2+25,"Recomend Fullscreen (Press F)")	
}

draw_set_alpha(1)
if timer<20 {txt_alpha-=0.1}