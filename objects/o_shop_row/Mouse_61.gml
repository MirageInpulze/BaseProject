/// @description Insert description here
// You can write your code in this editor
if (!global.is_open_shopping_pop_up){
	if (global.LastItemInZone == 0){
		y-= panel_height/4 - 2.5;
	}

	if (y < global.shoppingPanelEnd  && lastShopItem==1) {
		global.LastItemInZone = 1;
	}

	self.layer = layer_get_id("hidden_layer")
	if (y < global.shoppingPanelEnd && y > global.shoppingPanelStart) {
	self.layer = layer_get_id("shopping_panel_content")
	}

	show_debug_message("wheel down one time")
}