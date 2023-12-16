/// @desc Initialisation and Global variables
// You can write your code in this editor

// A seed for each instance
randomize();

global.GamePaused = false;
global.textspeed = .75;
global.isTextboxClosed = false;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

global.game_paused = false;
global.text_speed = 0.75;
global.window_width = 1280;
global.window_height = 720;


mx = mouse_x;
my = mouse_y;
global.mouse_mode = true;

room_goto(rm_main_menu);
window_set_size(global.window_width, global.window_height);
calculate_window_position(display_get_width(), display_get_height(), global.window_width, global.window_height);






