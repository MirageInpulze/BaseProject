/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(sTextBox, background, x1, y1, x2 - x1, y2 - y1);
draw_set_font(fnM3x6);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(message, 1, textProgress);
draw_text((x2+x2)*.5, y1+8, _print);
draw_set_color(c_white);
draw_text((x2+x2)*.5, y1+7, _print);