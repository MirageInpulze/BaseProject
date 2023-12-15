/// @description Insert description here
// You can write your code in this editor
//Draw the grid to debug
var _xx = 0
var _cs = obj_crops_manager.cell_size

var _r =s_room_width div _cs

draw_set_alpha(0.3)

repeat(_r) {
	draw_line_color(_xx,0, _xx, s_room_height, c_white, c_white)
	_xx += _cs
}

var _yy = 0
_r =s_room_height div _cs

repeat(_r) {
	draw_line_color(0, _yy, s_room_width, _yy, c_white, c_white)
	_yy += _cs
}

draw_set_alpha(1)


