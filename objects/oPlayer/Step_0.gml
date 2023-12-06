_inputH = keyboard_check(vk_right) - keyboard_check(vk_left);
_inputV = keyboard_check(vk_down) - keyboard_check(vk_up);
_inputD = point_direction(0,0,_inputH,_inputV);
_inputM = point_distance(0,0,_inputH,_inputV);
keyActivate = keyboard_check_pressed(vk_space);
keyRoll = keyboard_check_pressed(vk_shift);
keyAttack = mouse_check_button(mb_left);
keyItem = mouse_check_button(mb_right);


if (!global.GamePaused) script_execute(state);

depth = -bbox_bottom

