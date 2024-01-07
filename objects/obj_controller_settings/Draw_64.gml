/// @Description Draw the pause menu
// You can write your code in this editor






if (pause_settings)
{
	draw_set_alpha(1.0);
	draw_set_color(make_color_rgb(66, 37, 1));
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_transformed(RESOLUTION_W * 0.5, RESOLUTION_H * 0.3, "...Settings...", scale_factor, scale_factor, 0);
	
	for (var i = 0; i < array_length(pause_settings_option); i++)
	{
		var _print = "";
		pause_settings_option[0] = "BGM volume: " + string(bgm_volume_value) + "%";
		pause_settings_option[1] = "SFX volume: " + string(sfx_volume_value) + "%";
		if (i == pause_settings_option_selected)
		{
			_print += "> " + pause_settings_option[i] + " <";
		}
		else if(window_get_fullscreen() && i == 3) // Make window size settings unavailable if game is full screen
		{
			_print += pause_settings_option[i];
			draw_set_alpha(0.3);
		}
		else
		{
			_print += pause_settings_option[i];
			draw_set_alpha(1);
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






