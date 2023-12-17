/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_anykey) and string_length(global.display_buying_number) = 1 and global.display_buying_number=="0"){
	global.display_buying_number = string_digits(keyboard_string);
	keyboard_string = "";
} else if(keyboard_check(vk_anykey)  ) {
	global.display_buying_number = global.display_buying_number + string_digits(keyboard_string);
	keyboard_string = "";
} 


if (keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer = 2){
	global.display_buying_number = string_delete(global.display_buying_number, string_length(global.display_buying_number),1);
	delete_timer = 0;
	keyboard_string="";
}

if (keyboard_check_pressed(vk_backspace)){
	global.display_buying_number = string_delete(global.display_buying_number, string_length(global.display_buying_number),1);
	keyboard_string="";
	delete_timer=-4;
}

if (delete_timer != 2){
	delete_timer ++;
}

if (global.display_buying_number!=""){
	global.buying_number = real(global.display_buying_number)
} else {
	global.buying_number = 0;
	global.display_buying_number="0";
}
if (global.buying_number <= 0){
	global.buying_number = 0;
	global.display_buying_number="0";
}

if (global.current_max_buying > 999) {
	if (global.buying_number > 999){
		global.buying_number = 999;
		global.display_buying_number = "999";
	}
} else {
	if (global.buying_number > global.current_max_buying){
		global.buying_number = global.current_max_buying;
		global.display_buying_number = string(global.current_max_buying);
	}
}


