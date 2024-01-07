// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game(){
	// Create save map
	// Add infomation for save files here
	var _save_map = ds_map_create();
	_save_map[? "room"] = global.prev_room;
	_save_map[? "character_name"] = global.character_name;
	_save_map[? "farm_name"] = global.farm_name;
	_save_map[? "currentMoney"] = global.currentMoney;
	_save_map[? "targetX"] = global.targetX;
	_save_map[? "targetY"] = global.targetY;
	//_save_map[? "playerInventory"] = global.playerInventory;

	
	
	// Save all this to a string
	var _save_string = json_encode(_save_map);
	save_string_to_file("save" + string(global.game_save_slot) + ".sav", _save_string);
	show_debug_message(_save_string);
	
	// Nuke the data
	ds_map_destroy(_save_map);
	// show_debug_message("Game saved!");
	
	// Save the inventory in a separate file
	var _inventory_string = global.playerInventory.toString();
	save_string_to_file("inventory" + string(global.game_save_slot) + ".sav", _inventory_string);
	show_debug_message(_inventory_string);
	
	// Save crop in another separate file
	var _crop_struct = grid_to_struct(obj_crops_manager.ds_crops_data);
	var _crop_string = json_stringify(_crop_struct);
	save_string_to_file("crop_data" + string(global.game_save_slot) + ".sav", _crop_string);
	show_debug_message(_crop_string);

	
	
	
	show_debug_message("Game saved");
}

function save_string_to_file(_file_name, _string)
{
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _file_name);
	buffer_delete(_buffer);
}

// Stolen from Frosty Cat on Game maker forum


function grid_to_struct(grid) {
    var width = ds_grid_width(grid);
    var height = ds_grid_height(grid);
    var arrays = array_create(height);
    for (var yy = height-1; yy >= 0; --yy) {
        var currentRow = array_create(width);
        for (var xx = width-1; xx >= 0; --xx) {
            currentRow[xx] = grid[# xx, yy];
        }
        arrays[yy] = currentRow;
    }
    return {
        width: width,
        height: height,
        data: arrays
    };
}

function struct_to_grid(strc) {
    var height = strc.height;
    var width = strc.width;
    var arrays = strc.data;
    var grid = ds_grid_create(width, height);
    for (var yy = height-1; yy >= 0; --yy) {
        var currentRow = arrays[yy];
        for (var xx = width-1; xx >= 0; --xx) {
            grid[# xx, yy] = currentRow[xx];
        }
    }
    return grid;
}

