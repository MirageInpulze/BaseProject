/// @description Insert description here
// You can write your code in this editor

if (!global.isButtonClicked){
	global.buying_number = global.buying_number - 1 ;
	global.display_buying_number = string(global.buying_number);
	global.isButtonClicked = true;
	show_debug_message("minus")
}