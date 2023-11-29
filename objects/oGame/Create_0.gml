/// @description Insert description here
// You can write your code in this editor
randomize();

global.GamePaused = false;
global.textspeed = .75;
global.isTextboxClosed = false;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(rVillage);



