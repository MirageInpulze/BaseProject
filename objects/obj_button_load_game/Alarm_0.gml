/// @description Move to load menu
// You can write your code in this editor

global.prev_room = room;

// Inherit the parent event
event_inherited();

room_goto(rm_load_game_menu);