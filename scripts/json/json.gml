function json_save(filename, struct, prettify = true){
    var json_string = json_stringify(struct, prettify);
    var json_string_length = string_byte_length(json_string);
    var json_buffer = buffer_create(json_string_length, buffer_fixed, 1);
    buffer_write(json_buffer, buffer_text, json_string);
    buffer_save(json_buffer, filename);
    buffer_delete(json_buffer);
    
    show_debug_message($"{filename} saved!");
}

function json_load(filename){
    var json_buffer = buffer_load(filename);
    var json_string = buffer_read(json_buffer, buffer_text);
    buffer_delete(json_buffer);
    
    show_debug_message($"{filename} loaded!");
    return json_parse(json_string);
}