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
	
	if (keyActivate)
	{
			if (!global.isTextboxClosed) 
		{
			//Check Entity
			//If there is no sctipt-do something else
			//If there is-activate
			//If activates NPC, turn NPC at player
			var _activateX = lengthdir_x(10, direction);
			var _activateY = lengthdir_y(10, direction);
			activate = instance_position(x + _activateX, y + _activateY, pEntity);
		
			if (activate == noone || activate.entityActivateScript == -1)
			{
				//Does something later
			}
			else
			{
				script_execute_ext(activate.entityActivateScript,activate.entityActivateArgs);
				if (activate.entityNPC)
				{
					with(activate)
					{
		            image_index = (other.direction/90)-2;
					}	
				}
			}
		}
	else global.isTextboxClosed = false;
	}
}
function PlayerLocked(){
	//Legit do nothing
}