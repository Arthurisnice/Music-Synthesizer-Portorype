draw_self()

draw_set_alpha(0.2)
draw_set_colour(c_black)
	
if point_in_rectangle(o_mouse.x,o_mouse.y,x+72,y+48,x+144,y+84)
{
	if mouse_check_button_pressed(mb_left)
	{
		valeu++
		random_number=irandom(1000)
	}
	
	draw_rectangle(x+72,y+48,x+144,y+84,false)
	
}

if point_in_rectangle(o_mouse.x,o_mouse.y,x+72,y+6,x+144,y+45)
{
	if mouse_check_button_pressed(mb_left)
	{
		valeu--
		random_number=irandom(1000)
	}
	
	draw_rectangle(x+72,y+6,x+144,y+45,false)
	
}
	
for (i=0;i<6;i++)
{
	var multi = 13
	if point_in_rectangle(o_mouse.x,o_mouse.y,x+3,y+10+(multi*i),x+70,y+20+(multi*i))
	{
		draw_rectangle(x+2,y+9+(multi*i),x+70,y+20+(multi*i),false)
		if mouse_check_button_pressed(mb_left)
		{
			random_number=irandom(1000)
			valeu=i
		}
	}
}


draw_set_alpha(1)
draw_set_colour(c_white)


if valeu<4 or valeu>6
{
	for (i=0;i<7;i++)
	{
		var size=50
		var offset=5*i
		var x_pos=x+10+sprite_width+(size*i)
		var y_pos=(y+sprite_height/2)
	
		radius = 0

		draw_roundrect_colour_ext(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,radius,radius,c_white,c_white,false)
		
		draw_roundrect_colour_ext(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,radius,radius,c_black,c_black,true)
	
		draw_set_colour(c_black)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		draw_set_font(Font_Notes_show)
		draw_text(x_pos+size/2+offset-1,y_pos,notes_array[i])
		draw_set_colour(c_white)
		draw_set_font(Font_Note_Text)
		if collision_rectangle(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,o_mouse,false,true) && mouse_check_button_pressed(mb_left)
		{
			with(o_note_creator)
			{
				var array_of_instrument = o_Instrument_chooser.base_array[o_Instrument_chooser.val_to_send]
				note_max_gain=array_of_instrument[0]
				note_attack_speed=array_of_instrument[1]
				note_release_speed=array_of_instrument[2]
				note_pitch_amt=array_of_instrument[3]+(array_of_instrument[4]*other.i)
				note_text=o_Instrument_chooser.notes_array[other.i]
			}
			o_note_creator.spawn=true
		}
	}
}
else if valeu==4
{
	for (i=0;i<7;i++)
	{
		var size=160
		var hight=50
		var offset=5
		var x_pos=x+10+sprite_width
		var y_pos=(y+sprite_height/2)
	
		radius = 0

		draw_roundrect_colour_ext(x_pos+offset,y_pos+hight/2,x_pos+size+offset,y_pos-hight/2,radius,radius,c_white,c_white,false)
		
		draw_roundrect_colour_ext(x_pos+offset,y_pos+hight/2,x_pos+size+offset,y_pos-hight/2,radius,radius,c_black,c_black,true)
		
		
	
		draw_set_colour(c_black)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		draw_set_font(Font_Notes_show)
		draw_text(x_pos+size/2+offset-1,y_pos,"Custom")
		draw_set_colour(c_white)
		draw_set_font(Font_Note_Text)
		if collision_rectangle(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,o_mouse,false,true) && mouse_check_button_pressed(mb_left)
		{
			with(o_note_creator)
			{
				var array_of_instrument = o_Instrument_chooser.base_array[o_Instrument_chooser.val_to_send]
				note_max_gain=array_of_instrument[0]
				note_attack_speed=array_of_instrument[1]
				note_release_speed=array_of_instrument[2]
				note_pitch_amt=array_of_instrument[3]+(array_of_instrument[4]*other.i)
				note_text="PENIS"
			}
			o_note_creator.spawn=true
		}
	}
}
else if valeu==5
{
	for (i=0;i<25;i++)
	{
		if i<12
		{
			var size=30
			var offset=5*i
			var x_pos=x+10+sprite_width+(size*i)
			var y_pos=((y-15)+sprite_height/2)
	
			radius = 0

			draw_roundrect_colour_ext(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,radius,radius,c_white,c_white,false)
		
			draw_roundrect_colour_ext(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,radius,radius,c_black,c_black,true)
			
			draw_set_colour(c_black)
			draw_set_valign(fa_middle)
			draw_set_halign(fa_center)
			draw_set_font(Font_Notes_show_small)
			draw_text(x_pos+size/2+offset-1,y_pos,letter_array[i])
			draw_set_colour(c_white)
			draw_set_font(Font_Note_Text)
			if collision_rectangle(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,o_mouse,false,true) && mouse_check_button_pressed(mb_left)
			{
				with(o_note_creator)
				{
					var array_of_instrument = o_Instrument_chooser.base_array[o_Instrument_chooser.val_to_send]
					note_max_gain=array_of_instrument[0]
					note_attack_speed=array_of_instrument[1]
					note_release_speed=array_of_instrument[2]
					note_pitch_amt=array_of_instrument[3]+(array_of_instrument[4]*other.i)
					note_text=o_Instrument_chooser.letter_array[other.i]
				}
				o_note_creator.spawn=true
			}
		
		}
		else
		{
			var sec_val=i-13
			sec_val = clamp(sec_val,0,26)
			var size=30
			var offset=5*sec_val
			var x_pos=x+10+sprite_width+(size*sec_val)
			var y_pos=((y+20)+sprite_height/2)
	
			radius = 0

			draw_roundrect_colour_ext(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,radius,radius,c_white,c_white,false)
		
			draw_roundrect_colour_ext(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,radius,radius,c_black,c_black,true)

			draw_set_colour(c_black)
			draw_set_valign(fa_middle)
			draw_set_halign(fa_center)
			draw_set_font(Font_Notes_show_small)
			draw_text(x_pos+size/2+offset-1,y_pos,letter_array[i])
			draw_set_colour(c_white)
			draw_set_font(Font_Note_Text)
			if collision_rectangle(x_pos+offset,y_pos+size/2,x_pos+size+offset,y_pos-size/2,o_mouse,false,true) && mouse_check_button_pressed(mb_left)
			{
				with(o_note_creator)
				{
					var array_of_instrument = o_Instrument_chooser.base_array[o_Instrument_chooser.val_to_send]
					note_max_gain=array_of_instrument[0]
					note_attack_speed=array_of_instrument[1]
					note_release_speed=array_of_instrument[2]
					note_pitch_amt=array_of_instrument[3]+(array_of_instrument[4]*other.i)
					note_text=o_Instrument_chooser.letter_array[other.i]
				}
				o_note_creator.spawn=true
			}
		}
	}
}