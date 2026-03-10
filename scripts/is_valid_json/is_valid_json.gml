function is_valid_json(json_string){
	try {
        var parsed_data = json_parse(json_string);
        return true; 
    } catch (e) {
        show_debug_message("JSON parse error: " + e.message);
        return false;
    }
}