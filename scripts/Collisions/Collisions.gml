// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision()
{
var collision = false;
var _entityList = ds_list_create();
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
//Hori entities
var _entityCount = instance_position_list(x+hSpeed, y, pEntity, _entityList, false)
var _snapX;
while (_entityCount > 0)
{
	var _entityCheck = _entityList[| 0];
	if (_entityCheck.entityCollision == true)
	{
		//Move as close as possible
		if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right + 1;
		else _snapX = _entityCheck.bbox_left -1;
		x = _snapX;
		hSpeed = 0;
		_collision = true;
		_entityCount = 0;
	}
	ds_list_delete(_entityList, 0);
	_entityCount--;
	
}

//Hori move commit
x += hSpeed;

//Clean list between axii
ds_list_clear(_entityList)

//Verti Tiles
if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
{
	y -= y mod TILE_SIZE;
	if (sign(vSpeed) == 1) y += TILE_SIZE -1;
	vSpeed = 0;
	collision = true;
}

//Verti entities
var _entityCount = instance_position_list(x, y + vSpeed, pEntity, _entityList, false)
var _snapY;
while (_entityCount > 0)
{
	var _entityCheck = _entityList[| 0];
	if (_entityCheck.entityCollision == true)
	{
		//Move as close as possible
		if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom + 1;
		else _snapY = _entityCheck.bbox_top -1;
		y = _snapY;
		vSpeed = 0;
		_collision = true;
		_entityCount = 0;
	}
	ds_list_delete(_entityList, 0);
	_entityCount--;
	
}

//Verti move commit
y += vSpeed;

//Kill list
ds_list_destroy(_entityList)


return collision;
}

function ScreenShake(Magnitude, Frames)
{

	with (oCamera) 
	{
		if (Magnitude > shakeRemain) 
		{
			shakeMagnitude = Magnitude; 
			shakeRemain = shakeMagnitude; 
			shakeLength = Frames; 
	
		}
	}

}

function EntityHitDestroy()
{
	instance_destroy();
	
	
	
}

function EntityHitSolid()
{
	flash = .5;
}	
	
	
function DropItems(item_x,item_y,item,obj)
{
	if(item > 1)
	{
		var _anglePerItem = 360/item;
		var _angle = random(360);
		for (var i = 0; i < item; i++)
		{
			with(instance_create_layer(item_x, item_y, "Instances",obj))
			{
				direction = _angle;
				spd = 0.75 + (item * 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
	}
	else instance_create_layer(item_x, item_y, "Instances",obj);
}

