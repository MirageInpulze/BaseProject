/// @description Insert description here
// You can write your code in this editor



draw_self();
draw_set_color(c_white);
draw_set_halign(fa_center);
//draw_text(x,y,global.display_buying_number);

draw_set_font(global.font);

draw_set_valign(fa_middle);

draw_text_transformed(x+ sprite_width/2 , y + sprite_height/2, global.display_buying_number ,0.6,0.6,0);



