global.resize = false;
global.font = fntLarge;

is_displayed = false;
if (y < global.shoppingPanelEnd && y > global.shoppingPanelStart) {
	is_displayed = true;
}

//var chosen_seed = asset_get_index("obj_o_" + global.currentSeed) 
//carrotSeed_instance = instance_create_layer(x+13, y+6,"instances_1",obj_o_carrot_seed);
firstShopItem = 0;
lastShopItem = 0;
currentSeedInstance = instance_create_layer(x+13, y+6,"shopping_panel_content", global.currentSeed);
//currentSeedInstance = instance_create_layer(x+13, y+6,"instances_1", obj_o_broccoflower_seed);
panel_height = sprite_get_height(spr_shopping_panel);

if (global.checkFirstShopItem == 1){
	firstShopItem = 1;
}
if (global.checkLastShopItem == 1){
	lastShopItem = 1;	
}

if (lastShopItem == 1){
	if (y < global.shoppingPanelEnd){
		global.LastItemInZone=1;
	}
}

if (y < global.shoppingPanelEnd && y > global.shoppingPanelStart && lastShopItem==1) {
	global.LastItemInZone = 1;
}
//carrotSeed_instance = instance_create_layer(x,y,"instances_1",obj_o_carrot_seed);

//npc_panel_instance = instance_create_layer(x+20,y+10,"instances_1", o_NpcPanel);
//var itemName_instance = instance_create_layer(x+50,y+10,"Instances_1", o_shop_item_name);
//var itemPrice_instance = instance_create_layer(x+60,y+10,"Instances_1", o_shop_item_price);
