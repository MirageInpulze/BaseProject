// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(_message, _background = 1)
{
	var _obj = instance_exists(oText) ? oTextQueued : oText;
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		message = _message;
		background = _background;
		originInstance = instance_exists(other) ? other.id : noone;
	}
	with (oPlayer)
	{
		if (state != PlayerLocked)
		{
			lastState = state;
			state = PlayerLocked;
		}
	}
}