/// @description Insert description here
// You can write your code in this editor

//Lightting base on daytime
if (room == rFarming) {
	var _c = light_color
	draw_set_alpha(darkness)

	draw_rectangle_color(0,0,gui_witdh,gui_height, _c, _c,_c,_c, false)

	draw_set_alpha(1)
}
//debug text
/*
_c = c_yellow
draw_set_font(fnt_text)
draw_text_color(10, 10, "Sec: " + string(seconds), _c,_c,_c,_c, 1)
draw_text_color(10, 20, "Min: " + string(minutes), _c,_c,_c,_c, 1)
draw_text_color(10, 30, "Hour: "+ string(hours), _c,_c,_c,_c, 1)
draw_text_color(10, 40, "Day: " + string(day), _c,_c,_c,_c, 1)
draw_text_color(10, 50, "Season:" + string(season), _c,_c,_c,_c, 1)
draw_text_color(10, 60, "Year:" + string(year), _c,_c,_c,_c, 1)
draw_text_color(10, 70, "Planting: P", _c,_c,_c,_c, 1)
draw_text_color(10, 80, "+12h: G", _c,_c,_c,_c, 1)
draw_text_color(10, 90, "Time: F", _c,_c,_c,_c, 1)
*/




