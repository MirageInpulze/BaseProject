/// @description Return to previous room
// You can write your code in this editor

room_goto(global.prev_room);
global.game_paused = false;

// Inherit the parent event
event_inherited();

