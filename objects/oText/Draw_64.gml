/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(sTextBox, background, x1, y1, room_width - 320, room_height - 270);
draw_set_font(fnM3x6);
draw_set_halign(-10);
draw_set_valign(y1+8);
draw_set_color(c_black);
var _print = string_copy(message, 1, textProgress);

if (responses[0] != -1) && (textProgress >= string_length(message))
{
	for (var i =0; i < array_length(responses); i++)
	{
		_print += "\n";
		if (i == responseSelected) _print += "> ";
		_print += responses[i];
		if (i == responseSelected) _print += " <";
		
	}

}

draw_text_ext(65, y1+8, _print, 10, 200);
draw_set_color(c_white);
draw_text_ext(65, y1+7, _print, 10, 200);
