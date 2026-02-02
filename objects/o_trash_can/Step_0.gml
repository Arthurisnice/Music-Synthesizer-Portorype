if place_meeting(x,y,o_mouse) && clicks==0 {image_index=1}
else if clicks=1 {image_index=2}
else {image_index=0}

if place_meeting(x,y,o_note) {timer=10}

if place_meeting(x,y,o_note) or !place_meeting(x,y,o_mouse) {clicks=0}

if place_meeting(x,y,o_mouse) && !place_meeting(x,y,o_note) && mouse_check_button_pressed(mb_left) && clicks==1
{
	if instance_exists(o_note) { instance_destroy(o_note) }
	clicks=0
}

if place_meeting(x,y,o_mouse) && !place_meeting(x,y,o_note) && mouse_check_button_pressed(mb_left) && timer==0
{
	clicks=1
}

if timer>0 {timer--}