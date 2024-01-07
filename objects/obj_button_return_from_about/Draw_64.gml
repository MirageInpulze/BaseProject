/// @description Draw the button with text
// You can write your code in this editor

// Draw Event
draw_self(); // Draw the sprite

draw_set_font(fnt_text);

// Draw text centered on the button
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x_difference, y_difference, button_text);


draw_set_halign(fa_left);
draw_set_valign(fa_top);



