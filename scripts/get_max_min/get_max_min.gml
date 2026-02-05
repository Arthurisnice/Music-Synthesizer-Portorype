function get_max_min(variable_arr){

var arr=array_create(0)

for (i=0;i<array_length(variable_arr);i++)
{
	if variable_arr[i].x>high_x {high_x=variable_arr[i].x}
	if variable_arr[i].y>high_y {high_y=variable_arr[i].y}			
}

}