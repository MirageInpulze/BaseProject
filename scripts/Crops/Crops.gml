/// @function reate_crop_type(_growth_state_duration)
/// @param _stage_1
/// @param _stage_2
/// @param _stage_3
/// @param _stage_4
/// @param _stage_5
/// @param _name
/// @param _cost
/// @description add a row of crop data to the grid
function create_crop_type(
_stage_1,
_stage_2, 
_stage_3, 
_stage_4, 
_stage_5, 
_name,
_cost
)
{
	 var _arg_num =  argument_count
	 var _height = 0;
	if !ds_exists(ds_crops_types, ds_type_grid) 
	{
		ds_crops_types = ds_grid_create(_arg_num, 1)
		_height = 1
	}
	else 
	{
		_height = ds_grid_height(ds_crops_types)
		ds_grid_resize(ds_crops_types, _arg_num, _height + 1)
		_height += 1
	}
	
	var _yy = _height - 1
	var _i = 0 
	repeat (_arg_num) 
	{
		ds_crops_types[# _i, _yy] = argument[_i]
		_i +=1
	}
}

/// @function instance_create_crop()
/// @param _xx  
/// @param _yy 
/// @param _crop_type mouse_x
/// @description instance_create_crop, auto snap the crop placement into a cell, may need to move the snap logic
/// to the part that call this 
function instance_create_crop(_xx, _yy, _crop_type) {
	
	//snap the location to a cell
	var _cs = obj_crops_manager.cell_size
	var _i_grid = obj_crops_manager.ds_crops_instances
	
	_xx = _xx div _cs
	_yy = _yy div _cs
	
	var _gx = _xx
	var _gy = _yy
	var _cell = _i_grid[# _gx, _gy]
	if (_cell == -1) {
		_xx = _xx * _cs
		_yy = _yy * _cs
	
		//TODO:Check for if the location for if is soil tile. Dont know it we have soil tile yet ?
		//var _lay_id = layer_get_id("nameOfSoilTile")
		//var _map_id = layer_tilemap_get_id(_lay_id)
		//var _data = tilemap_get_at_pixel(_map_id, _xx, _yy)
		//if _data == 0 { return false }
	
		//create and save the newly created crop's id to the ds_crops_instances
		var _ist = instance_create_layer(_xx , _yy,"Instances", get_crop_obj_id_by_crop_type(_crop_type))
		_i_grid[# _gx, _gy] = _ist
	
		with(_ist) {
			crop_type = _crop_type
			//growth_stage_duration = obj_crops_manager.ds_crops_types[# 0, _crop_type]
		}
		return _ist;
	} else {
		show_debug_message("There is already something here")
		return false
	}
	
}

function respawn_crop(_grid_x, _grid_y, _crop_type, _exp_point, _is_watered) {
	var _inst = instance_create_layer(_grid_x * cell_size, _grid_y * cell_size, "Instances",  get_crop_obj_id_by_crop_type(_crop_type))
	ds_crops_instances[# _grid_x, _grid_y]  = _inst
	var _types = ds_crops_types
	var _max_growth_stage = max_growth_stage

	with (_inst) {
		//update properties
		crop_type = _crop_type
		exp_point = _exp_point
		is_watered = _is_watered
		
		if (exp_point != -1) {
		//update sprite
			var _state_1_exp = _types[# 0, crop_type]
			var _state_2_exp = _types[# 1, crop_type]
			var _state_3_exp = _types[# 2, crop_type]
			var _state_4_exp = _types[# 3, crop_type]
			var _state_5_exp = _types[# 4, crop_type] //aka max_exp
		
			sprite_num = get_crop_spr_num(exp_point, _state_5_exp, max_sprite_num)
			if (exp_point <_state_1_exp ) {//when exit and reenter farm room in the same first day 
				growth_stage = 0
			} else if (exp_point < _state_2_exp) { // exp < stage 2
				growth_stage = 1
			} else if (exp_point < _state_3_exp) { // exp < stage 3
				growth_stage = 2
			} else if (exp_point < _state_4_exp) { // exp < stage 4
				growth_stage = 3
			} else if (exp_point < _state_5_exp) { // exp < stage 5
				growth_stage = 4
			} else { //stage 5 aka harvestable
				growth_stage = _max_growth_stage
				fully_grown = true
			}
		} else {
			fully_grown = false
			is_dead = true
		}
		
		show_debug_message("Respawned a " + obj_crops_manager.ds_crops_types[# 5, crop_type])
	}
	return _inst
}

/// @param _days_old
/// @param _days_not_watered
/// @param _bonus
/// @description this will not return 0 as this will should only be called on a day passed, by then the crop will be in stage 1 by default
/// except for when respawn a crop in the same day
function get_cur_exp(_days_old, _days_not_watered, _bonus) {	
	if (_days_old == 0) return 0
	if (_days_old == 1) return 100 + _bonus
	else return 100 + (_days_old - _days_not_watered - 1) * 100 + _bonus
}

/// @param _cur_exp
/// @param _max_exp
/// @param _max_spr_num
function get_crop_spr_num(_cur_exp, _max_exp, _max_spr_num) {
	var _spr_num = floor((_cur_exp / _max_exp) * _max_spr_num) 
	return _spr_num
}

/// @param _crop_type
/// @description 
function get_crop_obj_id_by_crop_type(_crop_type) {
	if (_crop_type) <= 7 return obj_fantasy_crop
	if (_crop_type) <= 9 return obj_wheat_eggplant_crop
	if (_crop_type) <= 21 return obj_simple_crop
	if (_crop_type) <= 29 return obj_fantasy_crop_2
	else return obj_tiny_wonder

}

/// @param _crop_type
/// @description 
function get_crop_spr_id_by_crop_type(_crop_type) {
	if (_crop_type) <= 7 return spr_fantasy_crops
	if (_crop_type) <= 9 return spr_wheat_eggplant_crop
	if (_crop_type) <= 21 return spr_simple_crops
	if (_crop_type) <= 29 return spr_fantasy_crops
	else return spr_tiny_wonder_farm

}

function create_sprite_crop_type(_sprite_id, _sprite_offset, _type_offset_, _max_sprite_index) {
	var _arg_num =  argument_count
	var _height = 0;
	if !ds_exists(ds_crop_sprites, ds_type_grid) 
	{
		ds_crop_sprites = ds_grid_create(_arg_num, 1)
		_height = 1
	}
	else 
	{
		_height = ds_grid_height(ds_crop_sprites)
		ds_grid_resize(ds_crop_sprites, _arg_num, _height + 1)
		_height += 1
	}
	
	var _yy = _height - 1
	var _i = 0 
	repeat (_arg_num) 
	{
		ds_crop_sprites[# _i, _yy] = argument[_i]
		_i +=1
	}
}

function make_crops_dead(){
	//this should be called when season change
	var _types = obj_crops_manager.ds_crops_types
	var _max_growth_stage = obj_crops_manager.max_growth_stage

	if (room == rFarming and instance_exists(obj_crop)) {
		with(obj_crop) {
			exp_point = -1
			fully_grown = false
			is_dead = true
		}
	} else if (room != rFarming and ds_crops_data[# 0, 0] != -1) { //make crop grow if player is outside the farm_room 
		var _h = ds_grid_height(ds_crops_data)
		var _i = 0; repeat(_h) {
			ds_crops_data[# 3,_i] = -1
			_i += 1
		} 
	}
	
}

function water_crop(_x, _y){
	if (room != rFarming) exit;
	var _x_cell = _x div obj_crops_manager.cell_size
	var _y_cell = _y div obj_crops_manager.cell_size
	
	var _inst = obj_crops_manager.ds_crops_instances[# _x_cell, _y_cell]
	if (instance_exists(_inst)) {
		_inst.is_watered = true
	}

}

function harvest_one(_x, _y){ 
	
	if (room != rFarming) exit;
	
	var _x_cell = _x div obj_crops_manager.cell_size
	var _y_cell = _y div obj_crops_manager.cell_size
	
	//TODO: Change sprite base on Crop type 
	var _spr_id = sCarot
	
	var _inst = obj_crops_manager.ds_crops_instances[# _x_cell, _y_cell]
	if (instance_exists(_inst) && _inst != -1) {
		if (_inst.fully_grown == true) {
			global.playerInventory.item_add( 
				obj_crops_manager.ds_crops_types[# 5, _inst.crop_type],
				1,
				_spr_id
			)
			instance_destroy(_inst)
			obj_crops_manager.ds_crops_instances[# _x_cell, _y_cell] = -1
		 
		} 
		
	}
}

function harvest_one_on_cell(_x_cell, _y_cell){ 
	if (room != rFarming || _x_cell < 0 || _y_cell < 0) exit;
	//TODO: Change sprite base on Crop type 
	var _spr_id = sCarot
	
	var _inst = obj_crops_manager.ds_crops_instances[# _x_cell, _y_cell]
	if (instance_exists(_inst) && _inst != -1) {
		if (_inst.fully_grown == true) {
			global.playerInventory.item_add( 
				obj_crops_manager.ds_crops_types[# 5, _inst.crop_type],
				1,
				_spr_id
			)
			instance_destroy(_inst)
			obj_crops_manager.ds_crops_instances[# _x_cell, _y_cell] = -1
		 
		} 
		
	}
}

function harvest_many(_x, _y, _tl, _t, _tr, _r, _br, _b, _bl, _l){ 
	if (room != rFarming) exit;
	
	var _x_cell = _x div obj_crops_manager.cell_size
	var _y_cell = _y div obj_crops_manager.cell_size
	
	repeat(_tl) {
		harvest_one_on_cell(_x_cell - 1, _y_cell - 1)
	}
	
	repeat(_t) {
		harvest_one_on_cell(_x_cell, _y_cell - 1)
	}
	
	repeat(_tr) {
		harvest_one_on_cell(_x_cell + 1, _y_cell - 1)
	}
	
	repeat(_r) {
		harvest_one_on_cell(_x_cell + 1, _y_cell)
	}
	
	repeat(_br) {
		harvest_one_on_cell(_x_cell + 1, _y_cell + 1)
	}
	
	repeat(_b) {
		harvest_one_on_cell(_x_cell, _y_cell + 1)
	}
	
	repeat(_bl) {
		harvest_one_on_cell(_x_cell - 1, _y_cell + 1)
	}
	
	repeat(_l) {
		harvest_one_on_cell(_x_cell - 1, _y_cell)
	}
}

function crop_destroy(_x, _y) {
	if (room != rFarming) exit;
	var _x_cell = _x div obj_crops_manager.cell_size
	var _y_cell = _y div obj_crops_manager.cell_size
	var _inst = obj_crops_manager.ds_crops_instances[# _x_cell, _y_cell]
	
	if (instance_exists(_inst) && _inst != -1) {
		instance_destroy(_inst)
		obj_crops_manager.ds_crops_instances[# _x_cell, _y_cell] = -1	
	}
}