notes_exit_arr=[]
note_recive_arr=[]
ready=false
timer=0
try_save=false
try_load=false
side=0
cnt=0
image_speed=0
if o_mouse.html==true
{
	instance_destroy()
}


if !directory_exists(working_directory+"Saved Songs") {
    directory_create(working_directory+"Saved Songs");
}