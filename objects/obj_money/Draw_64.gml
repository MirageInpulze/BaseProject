/// @description Insert description here
// You can write your code in this editor

if(global.game_paused) exit;

gui_witdh = display_get_gui_width()
gui_height = display_get_gui_height()



draw_set_font(fnt_text)

//draw_rectangle_color(gui_witdh - 64, gui_height - 16, gui_witdh, gui_height, c_blue, c_purple, c_red, c_green, true)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
/*
if(!global.is_open_shopping_panel){
	draw_text_color(gui_witdh - 48, gui_height - 16, string(global.currentMoney), c_yellow, c_orange, c_red, c_green, 1)
}
else{
	draw_text_color(gui_witdh , gui_height , string(global.currentMoney), c_yellow, c_orange, c_red, c_green, 1)
}
*/

draw_text_color(gui_witdh - 48, gui_height - 16, string(global.currentMoney), c_red, c_red, c_red, c_red, 1)

draw_sprite_ext(spr_gold, 0, gui_witdh - 64, gui_height - 16, 0.5, 0.5, 0, c_white, 1)


