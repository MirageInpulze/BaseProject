/// @description Initialisation & Variables
// You can write your code in this editor


// starts at noon
seconds = 12 * 3600;


minutes = 0;
hours = 0;

day = 1;
season = 1;
year =1;

time_increment = 20; // seconds per step



darkness = 0;
max_darkness = 0.7;
light_colour = c_black;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();


enum day_phase
{
	sunrise = 21600, // 6 * 3600
	morning = 30600, // 8.5 * 3600
	sunset = 61200, // 17 * 3600
	night = 72000, // 20 * 3600
}