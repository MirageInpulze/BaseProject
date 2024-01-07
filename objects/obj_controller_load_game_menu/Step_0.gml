/// @description Main controller
// You can write your code in this editor


// Switch to interacting with keyboard
if (!global.mouse_mode)
{		
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	load_menu_option_selected += (key_down - key_up);
	if (load_menu_option_selected >= array_length(load_menu_option)) load_menu_option_selected = 0;
	if (load_menu_option_selected < 0) load_menu_option_selected = array_length(load_menu_option) - 1;

	if(key_up || key_down) menu_reset = false;

	for (var i = 0; i < array_length(load_menu_option); i++)
	{
		if (i == load_menu_option_selected)
		{
			load_menu_option[i].image_alpha = 0.5;
		}
		else
		{
			load_menu_option[i].image_alpha = 1;
		}
	}
}

// Reset the menu to switch to interacting with mouse
if (global.mouse_mode)
{
	load_menu_option_selected = 0;
	if (!menu_reset)
	{
		for (var i = 0; i < array_length(load_menu_option); i++)
		{
			{
				load_menu_option[i].image_alpha = 1;
			}
		}
	}
	menu_reset = true;
}












