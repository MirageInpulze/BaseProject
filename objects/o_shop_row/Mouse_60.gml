/// @description Insert description here
// You can write your code in this editor
if (!global.is_open_shopping_pop_up){
if (y < global.shoppingPanelEnd && y > global.shoppingPanelStart && firstShopItem == 1) {
	global.FirstItemInZone = 1;
} 
if (firstShopItem == 1){
	if (y >= global.shoppingPanelEnd || y <= global.shoppingPanelStart){
	global.FirstItemInZone = 0;
	}
}
if (lastShopItem == 1){
	if (y + panel_height/4 - 2.5 >= global.shoppingPanelEnd){
	global.LastItemInZone = 0;
	}
}
if (global.FirstItemInZone == 0){
	y+= panel_height/4 -2.5;
}
self.layer = layer_get_id("hidden_layer") 
if (y < global.shoppingPanelEnd && y > global.shoppingPanelStart) {
self.layer = layer_get_id("shopping_panel_content")
}
}

