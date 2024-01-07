/// @description Insert description here
// You can write your code in this editor




/// @description Move down a bit for animation
// You can write your code in this editor

y = ystart + 1;

if(obj_character_name_field.text_input == "" || obj_farm_name_field.text_input == "")
{
	name_empty = true;
}
else if (string_length(obj_character_name_field.text_input) > 12
		|| string_length(obj_farm_name_field.text_input) > 12)
{
	name_empty = false;
	name_too_long = true;
}
else
{
	name_empty = false;
	name_too_long = false;
	name_valid = true;
	alarm[0] = 10;
}









