/// @description save the data of the crops on the current farm foom
//if (room = rm_farm) {
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size)
	ds_grid_clear(ds_crops_instances, 0)
	
	if ds_crops_data[# 0, 0] != -1 {
		var _inst_num = ds_grid_height(ds_crops_data)
		var _slot = 0; repeat(_inst_num) {
			respawn_crop(
				ds_crops_data[# 0, _slot],
				ds_crops_data[# 1, _slot],
				ds_crops_data[# 2, _slot],
				ds_crops_data[# 3, _slot],
				ds_crops_data[# 4, _slot]
				)
			_slot +=1
		}
	}
	//because respawn_crop only add data, so the current state of crop need to be set explicitly
	var _types = ds_crops_types
	var _max_growth_stage = max_growth_stage
	with(obj_crop) {
		var _state_1_exp = _types[# 0, crop_type]
		var _state_2_exp = _types[# 1, crop_type]
		var _state_3_exp = _types[# 2, crop_type]
		var _state_4_exp = _types[# 3, crop_type]
		var _state_5_exp = _types[# 4, crop_type] //aka max_exp
		
		sprite_num = get_crop_spr_num(exp_point, _state_5_exp, max_sprite_num)
			if (_cur_exp <_state_1_exp ) {//when exit and reenter farm room in the same first day 
				growth_stage = 0
			} else if (_exp < _state_2_exp) { // exp < stage 2
				growth_stage = 1
			} else if (_exp < _state_3_exp) { // exp < stage 3
				growth_stage = 2
			} else if (_exp < _state_4_exp) { // exp < stage 4
				growth_stage = 3
			} else if (_exp < _state_5_exp) { // exp < stage 5
				growth_stage = 4
			} else { //stage 5 aka harvestable
				//growth_stage = 5
				growth_stage = _max_growth_stage
				fully_grown = true
			}
	}
//}

 
