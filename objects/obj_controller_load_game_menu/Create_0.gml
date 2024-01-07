/// @description Variables
// You can write your code in this editor

slot_selected = 0;
loading_started = false;


for(var _slot = 0; _slot <= 2; _slot++)
{
	var _file_name = "save" + string(_slot) + ".sav";
	if(file_exists(_file_name))
	{
		slot_data[_slot] = load_json_from_file(_file_name);
		
	}
	else slot_data[_slot] = -1;
}

load_menu_option = [obj_save_1_to_load, obj_save_2_to_load, obj_save_3_to_load,
	obj_button_return_from_load];

load_menu_option_selected = 0;

menu_reset = false;



