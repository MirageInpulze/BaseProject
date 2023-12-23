/// @description Insert description here
// You can write your code in this editor

if (!global.isButtonClicked){
	instance_destroy(global.buying_pop_up_panel_instance);
	instance_destroy(global.min_button_instance);
	instance_destroy(global.minus_button_instance);
	instance_destroy(global.buying_number_input_instance);
	instance_destroy(global.plus_button_instance);
	instance_destroy(global.max_button_instance);
	instance_destroy(global.buy_button_instance);
	instance_destroy(global.cancel_button_instance);
	global.is_open_shopping_pop_up = false;
	
	// add handle buying here 
	// handle money changing and add item to inventory
	
	// item_add("obj_o_broccoflower_seed",2, "spr_broccoflower_seed")
	if (global.buying_number > 0){
	global.playerInventory.item_add(global.current_shopping_item.name,global.buying_number,global.current_shopping_item.sprite_index)
	global.currentMoney = global.currentMoney - global.currentItemPrice*global.buying_number;
	}
}