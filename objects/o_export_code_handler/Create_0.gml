notes_exit_arr=[]
note_recive_arr=[]
text_size=[2,2,2,2,2,3,]
text_decimal=[]
temp_coverted_array=[]
sprite_layout=[]
ready=false
timer=0
loaded_=""
try_save=false
try_load=false
side=0
cnt=0

text_timer=0

image_speed=0
if o_mouse.html==true
{
	instance_destroy()
}


if !directory_exists(working_directory+"Saved Songs") {
    directory_create(working_directory+"Saved Songs");
}

x_offset_mine=x

image_speed=0

