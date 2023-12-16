/// @Description Draw the pause menu
// You can write your code in this editor




if (pause_main)
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_transformed(RESOLUTION_W * 0.5, RESOLUTION_H * 0.3, "...Game paused...", scale_factor, scale_factor, 0);

	
	for (var i = 0; i < array_length(pause_option); i++)
	{
		var _print = "";
		if (i == pause_option_selected)
		{
			_print += "> " + pause_option[i] + " <";
		}
		else
		{
			_print += pause_option[i];
			draw_set_alpha(0.7);
		}
		draw_text_transformed(RESOLUTION_W * 0.5, RESOLUTION_H * 0.4 + 18 + (i*12*scale_factor), _print, scale_factor, scale_factor, 0);
		draw_set_alpha(1.0);
	}
}

if (pause_settings)
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_transformed(RESOLUTION_W * 0.5, RESOLUTION_H * 0.3, "...Game paused...", scale_factor, scale_factor, 0);
	
	for (var i = 0; i < array_length(pause_settings_option); i++)
	{
		var _print = "";
		if (i == pause_settings_option_selected)
		{
			_print += "> " + pause_settings_option[i] + " <";
		}
		else if(window_get_fullscreen() && i == 3)
		{
			_print += pause_settings_option[i];
			draw_set_alpha(0.3);
		}
		else
		{
			_print += pause_settings_option[i];
			draw_set_alpha(0.7);
		}
		draw_text_transformed(RESOLUTION_W * 0.5, RESOLUTION_H * 0.4 + 18 + (i*12*scale_factor), _print, scale_factor, scale_factor, 0);
		draw_set_alpha(1.0);
	}
		
}

if (resolution_settings)
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_transformed(RESOLUTION_W * 0.5, RESOLUTION_H * 0.3, "...Game paused...", scale_factor, scale_factor, 0);
	
	for (var i = 0; i < array_length(resolution_settings_option); i++)
	{
		var _print = "";
		if (i == resolution_settings_option_selected)
		{
			_print += "> " + resolution_settings_option[i] + " <";
		}
		else
		{
			_print += resolution_settings_option[i];
			draw_set_alpha(0.7);
		}
		draw_text_transformed(RESOLUTION_W * 0.5, RESOLUTION_H * 0.4 + 18 + (i*12*scale_factor), _print, scale_factor, scale_factor, 0);
		draw_set_alpha(1.0);
	}
}






