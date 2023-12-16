// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function calculate_window_position(_screen_width, _screen_height, _window_width, _window_height){
	window_set_position((_screen_width - _window_width) / 2, (_screen_height - _window_height) / 2);
}