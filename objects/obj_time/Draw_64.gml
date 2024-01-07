/// @description Insert description here
// You can write your code in this editor
//draw_self()

if(global.game_paused) exit

gui_height = display_get_gui_height()
gui_width = display_get_gui_width()

var col = c_black

draw_sprite_ext(spr_time,0,gui_width - 88, 1, 1, 1, 0, c_white, 1)

draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_set_font(fnt_text)

var season = "Spring"
if(obj_day_cycle.season == SEASON.SPRING){
	season = "Spring"
}else if(obj_day_cycle.season == SEASON.SUMMER){
	season = "Summer"
}else if(obj_day_cycle.season == SEASON.FALL){
	season = "Fall"
}else if(obj_day_cycle.season == SEASON.WINTER){
	season = "Winter"
}

draw_text_color(gui_width - 80, 3, "Day " + string(obj_day_cycle.day) + " , " + season, col, col ,col ,col ,1)


if(obj_day_cycle.hours < 10 && obj_day_cycle.display_min < 10){
	draw_text_color(gui_width - 32, 13, "0"+string(floor(obj_day_cycle.hours)) + ":" + "0"+string(floor(obj_day_cycle.display_min)), col, col ,col ,col ,1)
}else if(obj_day_cycle.hours < 10 && obj_day_cycle.display_min >= 10){
	draw_text_color(gui_width - 32, 13, "0"+string(floor(obj_day_cycle.hours)) + ":" + string(floor(obj_day_cycle.display_min)), col, col ,col ,col ,1)
}else if(obj_day_cycle.hours >= 10 && obj_day_cycle.display_min < 10){
	draw_text_color(gui_width - 32, 13, string(floor(obj_day_cycle.hours)) + ":" + "0"+string(floor(obj_day_cycle.display_min)), col, col ,col ,col ,1)
}else if(obj_day_cycle.hours >= 10 && obj_day_cycle.display_min >= 10){
	draw_text_color(gui_width - 32, 13, string(floor(obj_day_cycle.hours)) + ":" + string(floor(obj_day_cycle.display_min)), col, col ,col ,col ,1)
}
