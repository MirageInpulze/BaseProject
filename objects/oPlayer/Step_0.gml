if(global.game_paused) exit;
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
		ChangeTile("Tiles_2", 12, 141, oPlayer.x, oPlayer.y)
		ChangeTile("Tiles_1", 12, 141, oPlayer.x, oPlayer.y)
	}


	if(keyboard_check_pressed(ord("J")) && global.itemChosen.name == "Watering Can"){
		
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
			if(CheckTile("Tiles_2", 141, oPlayer.x, oPlayer.y) || CheckTile("Tiles_1", 141, oPlayer.x, oPlayer.y)){
				var _inst = instance_create_crop(x,y, _plant_id)
				//TODO: subtract the crop seed in inventory
				if(_inst){
					global.playerInventory.item_subtract(global.itemChosen.name, 1)
				}
			}
		}
	
	}
	
	if (room == rFarming && instance_exists(obj_crop) && keyboard_check_pressed(ord("C"))) {
		harvest_one(x,y)
	}
}