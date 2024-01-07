/// @description Initialisation & Variables
// You can write your code in this editor

pause_main = false;
pause_save = false;
pause_load = false;
pause_settings = false;
resolution_settings = false;
system_width = display_get_width();
system_height = display_get_height();

key_pressed = false; // To check if anykey is currently pressed

bgm_volume_value = 40;
sfx_volume_value = 50;

pause_option = ["Continue", "Save game", "Load game", "Settings", "Return to main menu", "Exit"];
pause_settings_option = ["BGM volume: ", "SFX volume: ", "Window Type", "Window Size", "Return"];
resolution_settings_option = ["1280 x 720", "1600 x 900", "1920 x 1080", "Return"];



pause_option_selected = 0;
pause_settings_option_selected = 0;
value_change = 0;
resolution_settings_option_selected = 0;
// scale_factor = window_get_width() / RESOLUTION_W;
scale_factor = 1; // Back to built in scaling








