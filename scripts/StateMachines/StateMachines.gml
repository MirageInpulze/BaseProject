//// Script assets have changed for v2.3.0 see
//// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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
sprite_index = spriteWalk;
FourDirectionAnimate();

	if (keyAttack)
	{
		state = PlayerAttack;
		stateAttack = AttackSlash;
	}


	if (keyRoll)
	{
		state = PlayerRoll;
		moveDistanceRemaining = distanceRoll;
	}
	
	if (keyActivate)
	{
			if (!global.isTextboxClosed) 
		{
			//Check Entity
			//If there is no sctipt-do something else
			//If there is-activate
			//If activates NPC, turn NPC at player
			//var _activateX = lengthdir_x(10, direction);
			//var _activateY = lengthdir_y(10, direction);
			//activate = instance_position(x + _activateX, y + _activateY, pEntity);
		
			//if (activate == noone || activate.entityActivateScript == -1)
			//{
			//	//Does something later
			//}
			//else
			//{
			//	script_execute_ext(activate.entityActivateScript,activate.entityActivateArgs);
			//	if (activate.entityNPC)
			//	{
			//		with(activate)
			//		{
		    //        image_index = (other.direction/90)-2;
			//		}	
			//	}
			//}
			 var _e = instance_nearest(x, y, pEntity);
		if (_e != noone)
		{
			if (point_distance(x, y, _e.x, _e.y) < 25)
			{
				//Face Player
				if (_e.entityNPC)

				{
					with (_e) 
					{
						direction = point_direction(x, y, other.x, other.y);
						image_index = (other.direction/90)-2;
					}
				}			
				//ActivateScript
				if (_e.entityActivateScript != -1)
				{
					script_execute_ext(_e.entityActivateScript, _e.entityActivateArgs);
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


function PlayerRoll()
{
	hSpeed = lengthdir_x(spdRoll, direction);
	vSpeed = lengthdir_y(spdRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - spdRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min((( 1 - (moveDistanceRemaining/distanceRoll)) * _totalFrames), _totalFrames -1);
	
	
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerWalking;
	}
	
	if(_collided)
	{
		state = PlayerCollided;
		moveDistanceRemaining = distanceCollided;
		ScreenShake(8, 30)
	}
}

function PlayerCollided()
{
	hSpeed = lengthdir_x(spdCollided, direction-180);
	vSpeed = lengthdir_y(spdCollided, direction-180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - spdRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = sPlayerCollided;
	image_index = CARDINAL_DIR
	
	//Change Height
	z = 2*sin(((moveDistanceRemaining / distanceCollided) * pi) * distanceCollidedHeight);
	
	
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerWalking;
	}
}

function PlayerAttack()
{
	script_execute(stateAttack)
}