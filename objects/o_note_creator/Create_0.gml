pos_x=-10
start=false
arr=0
grid_x_arr = []
grid_y_arr= []
paused=true
base_scale_x=image_xscale
base_scale_y=image_yscale

timer=0
final_move=0
timer_count=0

spawn=false

for (i=0;i<room_width/10;i++)
{
	array_push(grid_x_arr,i*10)
}

for (i=0;i<room_height/32;i++)
{
	array_push(grid_y_arr,i*32)
}


note_max_gain=1
note_attack_speed=1
note_release_speed=1
note_pitch_amt=1
note_text=""