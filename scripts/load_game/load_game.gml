// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_game(_slot){
	global.game_save_slot = _slot;
	
	
	// Load Variables
	var _file = "save" + string(global.game_save_slot) + ".sav";
	if(file_exists(_file))
	{
		// Load the game data
		var _json = load_json_from_file(_file);
		
		// Global variables
		global.character_name = _json[? "character_name"];
		global.farm_name = _json[? "farm_name"];
		global.currentMoney = _json[? "currentMoney"];
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"];
		
		
		// Lists to arrays
		// Use for loops: https://www.youtube.com/watch?v=YpHEY939cXQ&list=PLPRT_JORnIuosvhfax2TQTEmN7OYTcSvK&index=49
		
		
		
		// Ds maps
		
		// Room
		room_goto(_json[? "room"]); // This go to save room cause it is the room before saving lol. fixed probably
		//room_goto(rFarming);
		
		ds_map_destroy(_json);
		// return true;
	}
	
	else
	{
		show_debug_message("No save in this slot");
		// return false;
	}
	
	
	// Load inventory
	var _inventory_file = "inventory" + string(global.game_save_slot) + ".sav";
	if(file_exists(_inventory_file))
	{
		// Remove current inventory data
		//with(global.playerInventory) instance_destroy();
		global.playerInventory = new Inventory();
		// Load inventory
		var _inventory_buffer = buffer_load(_inventory_file);
		var _inventory_string = buffer_read(_inventory_buffer, buffer_string);
		buffer_delete(_inventory_buffer);
		show_debug_message(_inventory_string);
		var _inventory_load_data = json_parse(_inventory_string);
		show_debug_message(string(typeof(_inventory_load_data)));
		while(array_length(_inventory_load_data) > 0)
		{
			var _inventory_load_entity = array_pop(_inventory_load_data);
			// show_debug_message(string(typeof(_inventory_load_entity)));
			show_debug_message(string(_inventory_load_entity));
			global.playerInventory.item_add(_inventory_load_entity.name, _inventory_load_entity.quantity, _inventory_load_entity.sprite);
			
		}
	}
	else
	{
		show_debug_message("Inventory file not found")
	}
	global.game_loaded = true;
	
	
	// Load Crop data
	var _crop_data_file = "crop_data" + string(global.game_save_slot) + ".sav";
	if(file_exists(_crop_data_file))
	{
		var _crop_buffer = buffer_load(_crop_data_file);
		var _crop_string = buffer_read(_crop_buffer, buffer_string);
		buffer_delete(_crop_buffer);
		show_debug_message(_crop_string);
		var _crop_load_data = json_parse(_crop_string);
		show_debug_message(string(typeof(_crop_load_data)));
		// ds_grid_create(5, 1) 
		ds_grid_copy(obj_crops_manager.ds_crops_data, struct_to_grid(_crop_load_data));
	}
}

function load_json_from_file(_file_name)
{
	var _buffer = buffer_load(_file_name);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}


