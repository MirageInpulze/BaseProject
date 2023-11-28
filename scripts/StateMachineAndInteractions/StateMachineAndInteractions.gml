// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function PlayerStateFree()
{
	if (_inputM != 0)
{
	direction = _inputD;	
	image_speed = 1;
}
else
{
	image_speed = 0;
	animIndex = 0;
}
hSpeed = lengthdir_x(spdWalk*_inputM,_inputD);
vSpeed = lengthdir_y(spdWalk*_inputM,_inputD);

PlayerCollision();
FourDirectionAnimate();
}



function PlayerCollision(){
var collision = false;
var _inputH = keyboard_check(vk_right) - keyboard_check(vk_left);
var _inputV = keyboard_check(vk_down) - keyboard_check(vk_up);
var _inputD = point_direction(0,0,_inputH,_inputV);
var _inputM = point_distance(0,0,_inputH,_inputV);

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