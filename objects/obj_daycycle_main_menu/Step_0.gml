/// @description 
// You can write your code in this editor


seconds += time_increment;
minutes = seconds / 60;
hours = minutes / 60;


var _darks, _colours, _pstart, _pend;
if (seconds > day_phase.sunrise and seconds <= day_phase.morning)
{
	// Sunrise
	_darks = [max_darkness, 0.2];
	_colours = [merge_color(c_black, c_navy, 0.3), c_orange];
	_pstart = day_phase.sunrise;
	_pend = day_phase.morning;
}
else if (seconds > day_phase.morning and seconds <= day_phase.sunset)
{
	// Daytime
	_darks = [0.2, 0, 0, 0, 0.2];
	_colours = [c_orange, c_orange, c_white, c_orange, c_orange];
	_pstart = day_phase.morning;
	_pend = day_phase.sunset;
}
else if (seconds > day_phase.sunset and seconds <= day_phase.night)
{
	// Sunset
	_darks = [0.2, max_darkness];
	_colours = [c_orange, c_navy, merge_color(c_black, c_navy, 0.3)];
	_pstart = day_phase.sunset;
	_pend = day_phase.night;
}
else 
{
	// Night
	_darks = [max_darkness];
	_colours = [merge_color(c_black, c_navy, 0.3)];
	_pstart = day_phase.night;
	_pend = day_phase.sunrise;
}

// Alter darkness and colours depend on time
// Colours

if (_pstart == day_phase.night) // Because night starts at a greater value than sunrise. A special case.
{
	light_colour = _colours[0];
}
else
{
	var _cc = ((seconds - _pstart) / (_pend - _pstart)) * (array_length(_colours) - 1); // Get the phase's phase to get c1 and c2. -1 because the array starts at 0
	var _c1 = _colours[floor(_cc)]; // Colour 1 to merge with colour 2
	var _c2 = _colours[ceil(_cc)]; // Colour 2 to merge with colour 1
	
	light_colour = merge_color(_c1, _c2, _cc - floor(_cc));
}

// Darkness
if (_pstart == day_phase.night) // Because night starts at a greater value than sunrise. A special case.
{
	darkness = _darks[0];
}
else
{
	var _dd = ((seconds - _pstart) / (_pend - _pstart)) * (array_length(_darks) - 1); // Get the phase's phase to get c1 and c2. -1 because the array starts at 0
	var _d1 = _darks[floor(_dd)]; // Colour 1 to merge with colour 2
	var _d2 = _darks[ceil(_dd)]; // Colour 2 to merge with colour 1
	
	darkness = merge_number_Long(_d1, _d2, _dd - floor(_dd));
}
#region Cycle check

if (seconds >= 86400)
{
	seconds = 0;
	day += 1;
	if (day > 30)
	{
		day = 1;
		season += 1;
		if (season > 4)
		{
			season = 1;
			year += 1;
		}
	}
}


#endregion



