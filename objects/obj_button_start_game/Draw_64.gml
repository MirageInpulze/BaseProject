/// @description Draw the button with text
// You can write your code in this editor

// Draw Event
draw_self(); // Draw the sprite

draw_set_font(fnt_text);

// Draw text centered on the button
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// draw_set_color(make_color_rgb(252, 196, 140));
draw_set_color(c_white);
draw_text(x, y, button_text);

draw_set_color(make_color_rgb(66, 37, 1));
if(name_empty)
draw_text(x, y - 55, "Invalid name!");

if(name_too_long)
draw_text(x, y - 55, "Name too long!");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
