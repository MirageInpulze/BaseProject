/// @description Pause the game
// You can write your code in this editor

if(keyboard_check_pressed(vk_escape)) && (room != rm_title) && (room != rm_main_menu_new) 
	&& (room != rm_new_game_menu) && (room != rm_save_game_menu) && (room != rm_load_game_menu)
	&& (room != rm_about_menu) && (room != rm_settings_menu)
{
	global.game_paused = !global.game_paused;
	/*
	if(global.game_paused)
	{
		with (all)
		{
			game_paused_image_speed = image_speed;
			image_speed = 0;
		}
	}
	else
	{
		with (all)
		{
			image_speed = game_paused_image_speed;
		}
	}
	*/
}

// get distance from fake mouse to real mouse
var _moving = point_distance(mx, my, mouse_x, mouse_y);

// update positions of fake mouse
mx = mouse_x;
my = mouse_y;

// If mouse is moving. Note: mouse_mode is true until a key is pressed
if (_moving) 
{
	global.mouse_mode = true;
}
else if (keyboard_check_pressed(vk_anykey))
{
	global.mouse_mode = false;
}

