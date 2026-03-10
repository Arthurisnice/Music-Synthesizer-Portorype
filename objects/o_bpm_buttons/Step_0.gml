x=o_mouse.cam_pos_x+o_bpm_controller.x_offset_mine

if image_alpha>0
{
	image_alpha-=0.1
}
if image_alpha<=0{instance_destroy()}