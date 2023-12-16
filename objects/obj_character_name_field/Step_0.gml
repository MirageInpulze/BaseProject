/// @description Record player's input
// You can write your code in this editor


if (is_selected)
{
	if (keyboard_check_pressed(vk_anykey)) {
	    var key = keyboard_key;
    
	    // Check if the pressed key is a valid printable character
	    if ((key >= 32 && key <= 126) || key == vk_space) {
	        // Append the pressed key to the text_input variable
	        text_input += chr(key);
	    } else if (key == vk_backspace) {
	        // Remove the last character when backspace is pressed
	        if (string_length(text_input) > 0) {
	            text_input = string_delete(text_input, string_length(text_input), 1);
	        }
	    }
	}
	sprite_index = spr_text_field_selected;
}

else
{
	sprite_index = spr_text_field;
}







