if x==start_x
{
	if place_meeting(x,y,o_mouse)
	{
		image_xscale=1.2
		image_yscale=image_xscale
	}
	else
	{
		image_xscale=1
		image_yscale=image_xscale
	}
}
if Menu_TEXT.y-10<=Menu_TEXT.start_y
{
	x=lerp(x,start_x,0.1)
	y=lerp(y,start_y,0.1)
	image_angle=lerp(image_angle,0,0.1)
}

if abs(x-start_x)<=1 {x=start_x;y=start_y}

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left)
{
	url_open("https://youtu.be/GYCCaocuWr4")
}