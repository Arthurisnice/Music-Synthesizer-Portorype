function scr_json_sanitize(_data) {
    if (is_numeric(_data)) {
        // Round to 3 decimal places
        return round(_data * 1000) / 1000;
    } 
    
    if (is_array(_data)) {
        for (var i = 0; i < array_length(_data); i++) {
            _data[i] = scr_json_sanitize(_data[i]);
        }
    } 
    
    if (is_struct(_data)) {
        var _keys = variable_struct_get_names(_data);
        for (var i = 0; i < array_length(_keys); i++) {
            var _k = _keys[i];
            _data[$ _k] = scr_json_sanitize(_data[$ _k]);
        }
    }
    
    return _data;
}