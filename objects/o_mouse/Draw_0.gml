if o_mouse.prioraty!=0  && touching==true
{
		color=c_red
}
else {color=c_white}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,1)

color=c_white

if keyboard_check(ord("D")) && keyboard_check(ord("B")) && keyboard_check_pressed(ord("G")) && debugg==false
{
	debugg=true
}
else if keyboard_check(ord("D")) && keyboard_check(ord("B")) && keyboard_check_pressed(ord("G")) && debugg==true
{
	debugg=false
}

if debugg==true
{
	draw_text(10,10,"Debbug ON")
}

if debugg==true
{
	draw_text(x, y-15,
    "prioraty: " + string(prioraty) + "\n" +
    "image_index: " + string(image_index) + "\n" +
    "offset_x: " + string(offset_x) + "\n" +
    "selectee: " + string(selectee)
);

}