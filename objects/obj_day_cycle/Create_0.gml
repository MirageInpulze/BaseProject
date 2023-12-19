/// @description Insert description here
// You can write your code in this editor
seconds = 6 * 60 * 60;
minutes = 0;
hours = 0;
weather = 0; //TODO: 

day = 1;
season = 1;
year = 1;
time_increment = 500 // number of sec increase each step(aka frame), set to 1/60 for real life time 
darkness = 0; // the opacity for a overlay to craete darkness
light_color = c_black

gui_witdh = display_get_gui_width()
gui_height = display_get_gui_height()

time_pause = true

max_darkness = 0.7
enum PHASE {
	SUNRISE = 6,
	DAYTIME = 8.5,
	SUNSET = 18, 
	NIGHTTIME = 22
}

is_grow_called_at_12 = false
is_grow_called_at_0 = false