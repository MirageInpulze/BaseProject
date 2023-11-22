/// @description Insert description here
// You can write your code in this editor

lerpProgress += (1-lerpProgress)*.02;
textProgress += global.textspeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(message);
	if(textProgress >= _messageLength)
	{
		instance_destroy();
	}
	else
	{
		if(textProgress > 2)
		{
			textProgress = _messageLength;
		}
	}		
}

