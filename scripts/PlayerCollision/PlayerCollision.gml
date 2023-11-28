// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
var collision = false;
var _inputH = keyboard_check(vk_right) - keyboard_check(vk_left);
var _inputV = keyboard_check(vk_down) - keyboard_check(vk_up);
var _inputD = point_direction(0,0,_inputH,_inputV);
var _inputM = point_distance(0,0,_inputH,_inputV);
	
	if place_meeting(x + hSpeed, y, oBarrier) hSpeed = 0;
	if place_meeting(x, y + vSpeed, oBarrier) vSpeed = 0;
//Hori Tiles
if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
{
	x -= x mod TILE_SIZE;
	if (sign(hSpeed) == 1) x += TILE_SIZE -1;
	hSpeed = 0;
	collision = true;
	
}
x += hSpeed;
//Verti Tiles
if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
{
	y -= y mod TILE_SIZE;
	if (sign(vSpeed) == 1) y += TILE_SIZE -1;
	vSpeed = 0;
	collision = true;
}
y += vSpeed;
return collision;
}