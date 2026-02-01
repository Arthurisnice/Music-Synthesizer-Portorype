function get_closest_val(array,target_val){
	static output=0
	for (i=0;i<array_length(array);i++)
	{
		if array[i]>=target_val {output=array[i]; break;}
	}
	return output
}