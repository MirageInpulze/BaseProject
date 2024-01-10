/// @description Insert description here
// You can write your code in this editor
show_debug_message("hello ")
if (global.is_shopping){
	var _price = 0;
			switch (global.itemChosen.name){
			case "Carrot": 
				_price = 100;
			break;
			case "Lettuce": 
				_price = 150;
			break;
			case "Wheat": 
				_price = 170;
			break;
			case "Eggplant": 
				_price = 100;
			break;
			case "Icy Sunflower": 
				_price = 1950;
			break;
			case "Sunflower": 
				_price = 350;
			break;
			case "Green Pepper": 
				_price = 170;
			break;
			case "Purple Cabbage": 
				_price = 430;
			break;
			case "Raddish": 
				_price = 450;
			break;
			case "Broccoflower": 
				_price = 650;
				show_debug_message("Broccoflower has harvested sprite, so cant be planted")
			break;
			case "Pumpkin Seeds": 
				_price = 9000;
			break;
			
			default:
			break;
		}
	global.playerInventory.item_subtract(global.itemChosen.name, 1)
	global.currentMoney += _price
}





