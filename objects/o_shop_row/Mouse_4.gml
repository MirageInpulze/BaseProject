/// @description Insert description here
// You can write your code in this editor
if (is_displayed) {
if (!global.is_open_shopping_pop_up){
	global.currentItemPrice = currentSeedInstance.price;
	global.current_shopping_item = currentSeedInstance;
	global.buying_pop_up_panel_instance = instance_create_layer(global.shopping_panel_x + sprite_get_width(spr_shopping_panel)/20 * 5 , global.shopping_panel_y +sprite_get_height(spr_shopping_panel)/5 ,"shopping_pop_up", obj_o_buying_pop_up_panel);
	global.is_open_shopping_pop_up = true;
}
}
//global.currentItemPrice = currentSeedInstance.price;
//if (global.currentMoney > currentSeedInstance.price){
//	global.currentMoney = global.currentMoney - currentSeedInstance.price;	
//}


