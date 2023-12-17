/// @description Insert description here
// You can write your code in this editor
global.display_buying_number = "0";
global.current_max_buying = floor(global.currentMoney / global.currentItemPrice);
global.isButtonClicked = false;

panel_width = sprite_width;
panel_height = sprite_height;
//add components
global.min_button_instance = instance_create_layer(x, y  ,"shopping_pop_up", obj_o_min_button);
global.minus_button_instance = instance_create_layer(x + panel_width/5, y ,"shopping_pop_up", obj_o_minus_button);
global.buying_number_input_instance = instance_create_layer(x + panel_width/5 * 2, y  ,"shopping_pop_up", obj_o_buying_number_input);
global.plus_button_instance = instance_create_layer(x + panel_width/5 * 3, y ,"shopping_pop_up", obj_o_plus_button);
global.max_button_instance = instance_create_layer(x + panel_width/5 * 4, y ,"shopping_pop_up", obj_o_max_button);
global.buy_button_instance = instance_create_layer(x + panel_width/10 + 5 , y + panel_height/3*2 ,"shopping_pop_up", obj_o_buy_button);
global.cancel_button_instance  = instance_create_layer(x + panel_width/5 * 3 , y + panel_height/3*2 ,"shopping_pop_up", obj_o_cancel_button);