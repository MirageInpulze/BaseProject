/// @description Insert description here
/// Take over the drawing management of crops and player (and maybe others) so that the object 
/// at higher y position will de draw first. Reuslt in player stand 'behind' the crops
var _inst_num = instance_number(obj_par_depth)
var _dgrid = ds_depth_grid

ds_grid_resize(_dgrid,2, _inst_num)

var _i = 0; with(obj_par_depth) {
	_dgrid[# 0, _i] = id
	_dgrid[# 1, _i] = y
	_i += 1
}

ds_grid_sort(_dgrid, 1, true)

var _inst; _i = 0; repeat(_inst_num) {
	_inst = _dgrid[# 0 , _i]
	with (_inst) {
		event_perform(ev_draw,0)
	}
	_i += 1
}


