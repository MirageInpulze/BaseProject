/// @description Insert description here
// You can write your code in this editor
//draw the crop image near the mouse to indicate which crop is being selected, for debuging purpose
if !is_planting {exit}

var _xx = mx div cell_size
var _yy = my div cell_size

var _gx = _xx
var _gy = _yy

_xx = _xx * cell_size
_yy = _yy * cell_size

var _c = c_green

//TODO:Check for if the location for if is soil tile. Dont know it we have soil tile yet ?
//var _lay_id = layer_get_id("nameOfSoilTile")
//var _map_id = layer_tilemap_get_id(_lay_id)
//var _data = tilemap_get_at_pixel(_map_id, _xx, _yy)
//if _data != 0 _c = c_white
if ds_crops_instances[# _gx, _gy] != 0 {
	_c = c_red
}  
draw_rectangle_color(_xx,_yy,_xx + cell_size, _yy + cell_size, _c,_c,_c,_c, true)

var _sprite_id = get_crop_spr_id_by_crop_type(selected_crop)
var _spr_offset = 0 
var _types_offset = 0 
var _max_spr_num = 0 
if (_sprite_id = spr_fantasy_crops) {
	if (selected_crop <= 7) {
	_spr_offset = ds_crop_sprites[# 1,  CROP_SPRITE_INFO.FANTASY]
	_types_offset = ds_crop_sprites[# 2,  CROP_SPRITE_INFO.FANTASY]
	_max_spr_num = ds_crop_sprites[# 3,  CROP_SPRITE_INFO.FANTASY]
	} else {
	_spr_offset = ds_crop_sprites[# 1,  CROP_SPRITE_INFO.FANTASY_2]
	_types_offset = ds_crop_sprites[# 2,  CROP_SPRITE_INFO.FANTASY_2]
	_max_spr_num = ds_crop_sprites[# 3,  CROP_SPRITE_INFO.FANTASY_2]
	}
} else if (_sprite_id = spr_wheat_eggplant_crop) {
	_spr_offset = ds_crop_sprites[# 1,  CROP_SPRITE_INFO.WHEAT_EGGPLANT]
	_types_offset = ds_crop_sprites[# 2,  CROP_SPRITE_INFO.WHEAT_EGGPLANT]
	_max_spr_num = ds_crop_sprites[# 3,  CROP_SPRITE_INFO.WHEAT_EGGPLANT]
} else if (_sprite_id = spr_simple_crops) {
	_spr_offset = ds_crop_sprites[# 1,  CROP_SPRITE_INFO.SIMPLE]
	_types_offset = ds_crop_sprites[# 2,  CROP_SPRITE_INFO.SIMPLE]
	_max_spr_num = ds_crop_sprites[# 3,  CROP_SPRITE_INFO.SIMPLE]
} else {
	_spr_offset = ds_crop_sprites[# 1,  CROP_SPRITE_INFO.TINY_WONDER_FARM]
	_types_offset = ds_crop_sprites[# 2,  CROP_SPRITE_INFO.TINY_WONDER_FARM]
	_max_spr_num = ds_crop_sprites[# 3,  CROP_SPRITE_INFO.TINY_WONDER_FARM]
}
draw_sprite_part(
	get_crop_spr_id_by_crop_type(selected_crop),
	0, 
	16 * (_max_spr_num + _spr_offset),
	(selected_crop - _types_offset) * 16,
	16,
	16,
	_xx,
	_yy
)