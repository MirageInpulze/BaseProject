// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(_message, _background, _responses){
	/// @arg message
	/// @arg background
	/// @arg [responses]
	if (!oPlayer.textBoxDelay) // Naud van Dalen test - worked!
	{
		var _obj;
		if (instance_exists(oText))
		{
			_obj = oTextQueued;
		}
		else
		{
			_obj = oText;
		}
		with (instance_create_layer(0,0,"Instances",_obj))
		{
			message = _message;
			if (instance_exists(other))
			{
				originInstance = other.id;
			}
			else
			{
				originInstance = noone;
			}
			if is_undefined(_background)
			{			
				background = 1;
			}
			else
			{
				background = _background;
			}			
			if is_undefined(_responses)
			{
				responses = [-1];
				responseScripts = [-1];
			}
			else
			{
				// trim markers from responses			
				var _array = _responses; // Bean Stinson test - Worked!
				for(var i = 0; i < array_length(_array); i++)

				{
					responses[i] = _array[i];  // Bean Stinson test - Worked!
					var _markerPosition = string_pos(":", responses[i]);
					responseScripts[i] = string_copy(responses[i],1,_markerPosition-1);
					responseScripts[i] = real(responseScripts[i]);
					responses[i] = string_delete(responses[i],1,_markerPosition);
					//breakpoint = 10;
				}
			}		
		}
		with(oPlayer)
		{
			if(state != PlayerLocked)
			{
				lastState = state;
				state = PlayerLocked;
			}
		}
	}
}

function DialougeResponse(_message)
{
	switch(_message)
	{
		case 0: break;
		case 1: NewTextBox("Response A Recieved", 1);  break;
		case 2: NewTextBox("Response B Recieved. Any Further Response?", 1, ["3:Yes","0:No"]); break;
		case 3: NewTextBox("Thanks For All Responses!", 1); break;
		default: break;
	}
}
