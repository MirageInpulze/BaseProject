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
	if (_cell == 0) {
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
	
	with (_inst) {
		crop_type = _crop_type
		exp_point = _exp_point
		is_watered = _is_watered
		show_debug_message("Respawned a " + ds_crops_types[# 5, crop_type])
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