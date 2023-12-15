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

if(keyboard_check_pressed(ord("J")) && global.itemChosen.name == "Hoe"){
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	
	var i = tilemap_get_at_pixel(map_id, oPlayer.x, oPlayer.y)

	if(i == 141 ){
		tilemap_set_at_pixel(map_id, 102, oPlayer.x, oPlayer.y);
	}
}


if(keyboard_check_pressed(ord("J")) && global.itemChosen.name == "Watering Can"){
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	
	var i = tilemap_get_at_pixel(map_id, oPlayer.x, oPlayer.y)

	if(i == 102){
		tilemap_set_at_pixel(map_id, 1, oPlayer.x, oPlayer.y);
	}
}
