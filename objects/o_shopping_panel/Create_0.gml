// Season id: 0 - Spring | 1 - Summer | 2 - Fall | 3 - Winter
global.SeasonSeeds = 
[
	[ "carrot_seed" , "wheat_seed" , "eggplant_seed" , "green_pepper_seed" , "purple_cabbage_seed" ],
	[ "raddish_seed" , "sunflower_seed" , "eggplant_seed"],
	[ "carrot_seed" ,  "pumpkin_seed" , "wheat_seed" , "purple_cabbage_seed" , "lettuce_seed" , "purple_lettuce_seed" ],
	[ "purple_lettuce_seed" , "lettuce_seed" , "broccoflower_seed" , "icy_sunflower_seed" ],
]

// temporary add money
global.currentMoney = 9999;

//
global.escape_exercuted = false;
global.shoppingPanelStart = y;
global.shoppingPanelEnd = y+ sprite_get_height(spr_shopping_panel) - 10;
global.LastItemInZone = 0;
global.FirstItemInZone = 1;
global.shopping_panel_x = x;
global.shopping_panel_y = y;
global.is_open_shopping_pop_up = false;

// create row
global.currentSeason = 2;

for (var i=0 ; i < array_length(global.SeasonSeeds[global.currentSeason]); i = i+1){
	global.checkFirstShopItem = 0;
	global.checkLastShopItem = 0;
	if (i==0){
		global.checkFirstShopItem = 1;
	}
	if (i== array_length(global.SeasonSeeds[global.currentSeason]) - 1){
		global.checkLastShopItem = 1;
	}
	global.currentSeed = asset_get_index("obj_o_" + global.SeasonSeeds[global.currentSeason,i]);
	instance_create_layer(x+5 , y+5 + (sprite_height-10)/4*i,"shopping_panel_content", o_shop_row);
}

//row_instance1 = instance_create_layer(x+5,y+5,"instances_1",o_shop_row);
//row_instance2 = instance_create_layer(x+5,y+35,"instances_1",o_shop_row);
//row_instance3 = instance_create_layer(x+5,y+65,"instances_1",o_shop_row);



//row_instance4 = instance_create_layer(x+5,y+95,"instances_1",o_shop_row);