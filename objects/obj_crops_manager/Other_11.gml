/// @description call this function to make the crop grow by a day
// You can write your code in this editor
var _types = obj_crops_manager.ds_crops_types
var _max_growth_stage = obj_crops_manager.max_growth_stage

if (instance_exists(obj_crop)) {
	with(obj_crop) {
		var _state_1_exp = _types[# 0, crop_type]
		var _state_2_exp = _types[# 1, crop_type]
		var _state_3_exp = _types[# 2, crop_type]
		var _state_4_exp = _types[# 3, crop_type]
		var _state_5_exp = _types[# 4, crop_type] //aka max_exp
		
		if growth_stage < _max_growth_stage { //not harvestable
			if (exp_point < _state_1_exp) exp_point += 50
			else {
				if (is_watered) {
					exp_point +=50 
				}
			}
			
			//change is_watered to fasle if it it at midnight
			//TODO: uncoment the below 
			//if (floor(obj_day_cycle.hours) == 0) is_watered = false
			
			sprite_num = get_crop_spr_num(exp_point, _state_5_exp, max_sprite_num); //set sprite base on cur_exp/max_exp 
			//NOTICE!!Sprite may not reflect the current stage, this is by design (aka a feature not error)
			//Because the number of sprite per crop is not fixed across assets, and this way of doing sprite is 
			//more resource-utilized(unused sprite is wasted sprite) and more fun!
			if (exp_point <_state_1_exp ) { //should not be true here, as this is called when a day pass, exp < stage 1
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
			
		} else { //harvestable, this is kindda bloated
			growth_stage = _max_growth_stage
			fully_grown = true
		}
	}
} else if (ds_crops_data[# 0, 0] != -1) { //make crop grow if player is outside the farm_room 
	var _h = ds_grid_height(ds_crops_data)
	var _i = 0; repeat(_h) {
		var _crop_type = ds_crops_data[# 2 ,_i]
		var _state_1_exp = _types[# 0, _crop_type]
		var _state_2_exp = _types[# 1, _crop_type]
		var _state_3_exp = _types[# 2, _crop_type]
		var _state_4_exp = _types[# 3, _crop_type]
		var _state_5_exp = _types[# 4, _crop_type] //aka max_exp
		
		if (ds_crops_data[# 3,_i]< _state_1_exp) ds_crops_data[# 3,_i] += 50
		else {
			if ds_crops_data[# 4,_i] {
					ds_crops_data[# 3,_i] +=50 
			}
		}
		if (floor(obj_day_cycle.hours) == 0) ds_crops_data[# 4,_i] = false
		_i += 1
	} 

}



	
	