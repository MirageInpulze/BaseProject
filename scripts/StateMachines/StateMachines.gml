// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerWalking(){
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