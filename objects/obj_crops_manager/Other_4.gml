/// @description save the data of the crops on the current farm foom
if (room = rFarming) {
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
}

 
