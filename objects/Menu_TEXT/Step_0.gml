if start==true
{
	image_xscale=lerp(image_xscale,1,0.05)
	image_yscale=image_xscale
	y=lerp(y,start_y,0.05)
	
	if y!=start_y 
	{
		var txt =instance_create_depth(x,y,depth+1,Menu_TEXT_ghost)
		txt.image_xscale=image_xscale
		txt.image_yscale=image_yscale
		txt.y=y
	}
}

if timer>0 {timer--}

if timer<=0 {start=true}

if keyboard_check_pressed(ord("F")) && !window_get_fullscreen()
{
	window_set_fullscreen(true)
}
else if keyboard_check_pressed(ord("F")) && window_get_fullscreen()
{
	window_set_fullscreen(false)
}