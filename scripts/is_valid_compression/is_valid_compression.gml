function is_valid_compression(_b64_string)
{	
	
	show_debug_message("TESTING COMPRESSION")
	
   var _compressed_buff = -1;
    var _decompressed_buff = -1;

    try {
        // 1. Decode Base64
        _compressed_buff = buffer_base64_decode(_b64_string);
        
        // Safety: Check if buffer exists and isn't empty
        if (!buffer_exists(_compressed_buff) || buffer_get_size(_compressed_buff) < 2) {
            if (buffer_exists(_compressed_buff)) buffer_delete(_compressed_buff);
			show_debug_message("RETURNING FALSE 1 ")
            return false;
        }

        // 2. HEADER CHECK: This prevents the "inflate failed" console error
        // If the first byte isn't 120, it's NOT a valid compressed buffer.
        if (buffer_peek(_compressed_buff, 0, buffer_u8) != 120) {
            buffer_delete(_compressed_buff);
			show_debug_message("RETURNING FALSE 2 ")
            return false; // Exit early so buffer_decompress is never called
        }

        // 3. Decompress
        _decompressed_buff = buffer_decompress(_compressed_buff);
        buffer_delete(_compressed_buff); // Don't need this anymore
        
        // 4. Verify decompression success
        if (_decompressed_buff != -1) {
            var _json_string = buffer_read(_decompressed_buff, buffer_string);
            buffer_delete(_decompressed_buff);

            // Check if string has actual content
            if (is_string(_json_string) && _json_string != "") {
				show_debug_message("RETURNING TRUE")
                return true;
            }
        }
    } catch (e) {
        // Catch any unexpected memory errors
    }

    // Cleanup if any buffer is still hanging around
    if (buffer_exists(_compressed_buff)) buffer_delete(_compressed_buff);
    if (buffer_exists(_decompressed_buff)) buffer_delete(_decompressed_buff);

    return false; // If we got here, something failed
}