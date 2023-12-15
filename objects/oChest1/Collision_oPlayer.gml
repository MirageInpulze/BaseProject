/// @description Insert description here
// You can write your code in this editor






/// @description Insert description here
// You can write your code in this editor

//if(keyboard_check_released(vk_right)||keyboard_check_released(vk_left)||keyboard_check_released(vk_up)||keyboard_check_released(vk_down)){

if(keyboard_check_pressed(ord("F"))){
	show_debug_message("cpf")
	global.player_chest1_collision = true
	global.chestOpened = true
	global.char_leave = !global.char_leave
}




