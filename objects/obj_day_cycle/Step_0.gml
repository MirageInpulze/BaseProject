/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("F"))){time_pause = !time_pause}
if (time_pause) {exit}
//Increase Time
seconds += time_increment
minutes = seconds/60
hours = minutes/60
//darkness= hours/24

//Cycle
if (hours >=24) {
	seconds = 0
	day += 1
	is_grow_called_at_0 = false
	is_grow_called_at_12 = false

	if(day > 30) {
		day = 1
		season +=1
		
		if(season > 4) {
			season = 1
			year +=1
		}
	}
	
}

//make crop grow each 12 hour
if (floor(hours) == 0 and !is_grow_called_at_0) {
	with(obj_crops_manager) {event_perform(ev_other, ev_user1)}
	is_grow_called_at_0 = true
}

if (floor(hours) == 12 and !is_grow_called_at_12) {
	with(obj_crops_manager) {event_perform(ev_other, ev_user1)}
	is_grow_called_at_12 = true
}

//lighting 
var _darks, _colours, _p_start, _p_end, _h
//set values for darkness and color
if (hours > PHASE.SUNRISE and hours <= PHASE.DAYTIME) { //sunrising
	_darks = [max_darkness, 0.2]
	_colours = [merge_color(c_black, c_navy, 0.3), c_orange]
	_p_start = PHASE.SUNRISE
	_p_end = PHASE.DAYTIME
	_h = hours
} else if (hours > PHASE.DAYTIME and hours <= PHASE.SUNSET) { //daytime
	_darks = [0.2, 0, 0, 0.2]
	_colours = [c_orange, c_orange, c_white, c_orange, c_orange]
	_p_start = PHASE.DAYTIME
	_p_end = PHASE.SUNSET
	_h = hours
} else if (hours > PHASE.SUNSET and hours <= PHASE.NIGHTTIME) {// sunset 
	_darks = [0.2, max_darkness]
	_colours = [c_orange, c_navy, merge_color(c_black, c_navy, 0.3)]
	_p_start = PHASE.SUNSET
	_p_end = PHASE.NIGHTTIME
	_h = hours
} else { //night
	_darks = [max_darkness]
	_colours = [merge_color(c_black, c_navy, 0.3)]
	_p_start = PHASE.NIGHTTIME
	_p_end = PHASE.SUNRISE + 24 //+=24 to get the period of time from 22PM to 6AM 
	if (hours <= PHASE.DAYTIME) {_h = hours + 24} 
	else {_h = hours}
}
//actually change the lighting
//color
var _cc = ((_h -_p_start) / (_p_end - _p_start)) * (array_length(_colours) -1)
var _c1 = _colours[floor(_cc)]
var _c2 = _colours[ceil(_cc)]
light_color = merge_color(_c1, _c2, _cc - floor(_cc))

//darkness
var _dd = ((_h -_p_start) / (_p_end - _p_start)) * (array_length(_darks) -1)
var _d1 = _darks[floor(_dd)]
var _d2 = _darks[ceil(_dd)]

darkness = merge_number(_d1, _d2, _dd - floor(_dd))
