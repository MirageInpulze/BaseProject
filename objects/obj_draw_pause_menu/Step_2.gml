/// @description Insert description here
// You can write your code in this editor



if (keyboard_check_pressed(vk_escape))
{
	pause_main = !pause_main;
}

if(global.game_paused == false)
{
	pause_main = false;
	pause_save = false;
	pause_load = false;
	pause_settings = false;
	resolution_settings = false;
	pause_option_selected = 0;
	pause_settings_option_selected = 0;
	resolution_settings_option_selected = 0;
}

if (pause_main)
{
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pause_option_selected += (key_down - key_up);
	if (pause_option_selected >= array_length(pause_option)) pause_option_selected = 0;
	if (pause_option_selected < 0) pause_option_selected = array_length(pause_option) - 1;
	
	key_activate = keyboard_check_pressed(vk_space);
	if (key_activate)
	{
		switch (pause_option_selected)
		{
			case 0: // Continue
			{
				global.game_paused = false;
			} break;
			case 1:
			{
				pause_main = false;
				pause_save = true;
			} break;
			case 2:
			{
				pause_main = false;
				pause_load = true;
			} break;
			case 3:
			{
				pause_main = false;
				pause_settings = true;
			} break;
			case 4:
			{
				global.game_paused = false;
			} break;
			case 5:
			{
				room_goto(rm_main_menu);
				global.game_paused = false;
			} break;
		}
		key_pressed = true;
	}
	if (keyboard_check_released(vk_space)) 
	{
		key_pressed = false;
	}
}

if (pause_settings)
{
	if (window_get_fullscreen())
	{
		pause_settings_option[2] = "Window type: Full Screen";
	}
	else
	{
		pause_settings_option[2] = "Window type: Windowed";
	}
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pause_settings_option_selected += (key_down - key_up);
	if (pause_settings_option_selected >= array_length(pause_settings_option)) pause_settings_option_selected = 0;
	if (pause_settings_option_selected < 0) pause_settings_option_selected = array_length(pause_settings_option) - 1;
	if (window_get_fullscreen() && pause_settings_option_selected == 3) pause_settings_option_selected += (key_down - key_up);
	
	// avoid space buffering
	if (keyboard_check_released(vk_space)) 
	{
		key_pressed = false;
	}
	key_activate = keyboard_check_pressed(vk_space);
	if (!key_pressed && key_activate)
	{
		switch (pause_settings_option_selected)
		{
			case 0: // BGM settings
			{
				
			} break;
			case 1: // SFX settings
			{
				
			} break;
			case 2: // Window type settings (Full Screen/Windowed
			{
				window_set_fullscreen(!window_get_fullscreen());
			} break;
			case 3:
			{
				pause_settings = false;
				resolution_settings = true;
			} break;
			case 4:
			{
				pause_settings = false;
				pause_main = true;
			} break;
		}
		key_pressed = true;
	}
	if (keyboard_check_released(vk_space)) 
	{
		key_pressed = false;
	}
}

if (resolution_settings)
{
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	resolution_settings_option_selected += (key_down - key_up);
	if (resolution_settings_option_selected >= array_length(resolution_settings_option)) resolution_settings_option_selected = 0;
	if (resolution_settings_option_selected < 0) resolution_settings_option_selected = array_length(resolution_settings_option) - 1;
	
	
	// Avoid space buffering
	if (keyboard_check_released(vk_space)) 
	{
		key_pressed = false;
	}
	key_activate = keyboard_check_pressed(vk_space);
	if (!key_pressed && key_activate)
	{
		switch (resolution_settings_option_selected)
		{
			case 0:
			{
				window_set_size(1280, 720);
				calculate_window_position(system_width, system_height, 1280, 720);
			} break;
			case 1:
			{
				window_set_size(1600, 900);
				calculate_window_position(system_width, system_height, 1600, 900);
			} break;
			case 2:
			{
				window_set_size(1920, 1080);
				calculate_window_position(system_width, system_height, 1920, 1080);
			} break;
			case 3:
			{
				resolution_settings = false;
				pause_settings = true;
			} break;
		}
	}
	if (keyboard_check_released(vk_space)) 
	{
		key_pressed = false;
	}
}






