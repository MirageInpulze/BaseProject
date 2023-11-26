/// @description Insert description here
// You can write your code in this editor

lerpProgress += (1-lerpProgress)*.02;
textProgress += global.textspeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

//Cycle Responses
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

responseSelected += (keyDown - keyUp);

var _max = array_length(responses) - 1;
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;

if (oPlayer.keyActivate)
{
	var _messageLength = string_length(message);
	if(textProgress >= _messageLength)
	{
		
		if (responses[0] != -1)
		{
			with (originInstance)
			DialougeResponse(other.responseScripts[other.responseSelected]);
		}
		
		
		
		
		instance_destroy();
		global.isTextboxClosed = true;
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticket--;
		}
		else
		{
			with (oPlayer) state = lastState;
		}
	}
	else
	{
		if(textProgress > 2)
		{
			textProgress = _messageLength;
		}
	}		
}

