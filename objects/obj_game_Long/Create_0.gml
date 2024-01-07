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

global.playerInventory = new Inventory();

global.game_loaded = false;

global.game_save_slot = 0;


// Mouse position to check if mouse is moving
mx = mouse_x;
my = mouse_y;
global.mouse_mode = false;

//
global.prev_room = 0;

room_goto(rm_title);
window_set_size(global.window_width, global.window_height);
calculate_window_position(display_get_width(), display_get_height(), global.window_width, global.window_height);






