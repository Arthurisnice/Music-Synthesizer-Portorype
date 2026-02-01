if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left)
{
	o_note_creator.pos_x=o_mouse.x
	if  instance_exists(o_note) {o_note.recalculate=true}
}