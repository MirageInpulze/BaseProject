/// @description Insert description here
// You can write your code in this editor

is_planting = false
if (room == rFarming) {
	//save all the data of the crops on the field to ds_crops_data
	var _inst_num = instance_number(obj_crop)
	if (_inst_num == 0) { ds_grid_clear(ds_crops_data, -1)}
	else {
		ds_grid_resize(ds_crops_data, ds_grid_width(ds_crops_data), _inst_num)
		var _gw = ds_grid_width(ds_crops_instances)
		var _gh = ds_grid_height(ds_crops_instances)
		var _slot = 0
		
		var _xx = 0; repeat (_gw) {
			var _yy = 0; repeat (_gh) {
				var _inst = ds_crops_instances[# _xx, _yy]
				
				if (_inst != -1) {
					ds_crops_data[# 0, _slot] = _xx 
					ds_crops_data[# 1, _slot] = _yy 
					ds_crops_data[# 2, _slot] = _inst.crop_type 
					ds_crops_data[# 3, _slot] = _inst.exp_point
					ds_crops_data[# 4, _slot] = _inst.is_watered
					
					_slot += 1
				}
				
				_yy += 1
			}	
			_xx += 1
		}
	}
	ds_grid_destroy(ds_crops_instances)
}



