state = PlayerWalking;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;



collisionMap = layer_tilemap_get_id(layer_get_id("lCollision"));
textBoxDelay = 0;
spdWalk = 2;
spdRoll = 3;
spdCollided = 1.5;
distanceRoll = 72;
distanceCollided = 40;
distanceCollidedHeight = 12;


spriteWalk = sPlayerWalk
spriteRoll = sPlayerRoll
animIndex = 0;
vSpeed = 0;
hSpeed = 0;
z = 0;

if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

function FourDirectionAnimate() {
	//Update Sprite
	var _animLength = sprite_get_number(sprite_index) / 4;
	image_index = animIndex + (((direction div 90) mod 4) * _animLength);
	animIndex += sprite_get_speed(sprite_index) / 60;

	//If animation would loop on next game step
	if (animIndex >= _animLength)
	{
		animationEnd = true;	
		animIndex -= _animLength;
	}else animationEnd = false;
}
