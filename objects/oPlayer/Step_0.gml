if (!global.is_open_shopping_panel){
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
	//TODO: tiles bug after Removing garden
	if(keyboard_check_pressed(ord("J")) && global.itemChosen.name == "Hoe"){
		var lay_id = layer_get_id("Tiles_1");
		var map_id = layer_tilemap_get_id(lay_id);
		show_debug_message("presssing")
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
		
		//check if these is crop and water it 
		water_crop(x,y)
	}
	//player planting
	var _plant_id = -1;
	if (room == rFarming && keyboard_check_pressed(ord("J"))) {
		switch (global.itemChosen.name){
			case "Carrot Seeds": 
				_plant_id = 0;
			break;
			
			case "Lettuce Seeds": 
				_plant_id = 4;
			break;
			case "Wheat Seeds": 
				_plant_id = 8;
			break;
			case "Eggplant Seeds": 
				_plant_id = 9;
			break;
			case "Icy Sunflower Seeds": 
				_plant_id = 17;
			break;
			case "Sunflower Seeds": 
				_plant_id = 19;
			break;
			case "Green Pepper Seeds": 
				_plant_id = 20;
			break;
			case "Purple Cabbage Seeds": 
				_plant_id = 23;
			break;
			case "Raddish Seeds": 
				_plant_id = 25;
			break;
			case "Broccoflower Seeds": 
				_plant_id = -1;
				show_debug_message("Broccoflower has harvested sprite, so cant be planted")
			break;
			case "Pumpkin Seeds": 
				_plant_id = 30;
			break;
			
			default:
			
			break;
		}
		
		if (_plant_id != -1) {
			var _name = global.itemChosen.name
			var _inst = instance_create_crop(x,y, _plant_id)
			if (_inst) global.playerInventory.item_subtract(_name,1)
			
		}
	
	}
	
	if (room == rFarming && instance_exists(obj_crop) && keyboard_check_pressed(ord("C"))) {
		harvest_one(x,y)
	}
}