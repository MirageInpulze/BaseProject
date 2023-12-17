/// @description Insert description here
// You can write your code in this editor
if (!global.escape_exercuted){
if (!global.is_open_shopping_pop_up){
if (global.is_open_shopping_panel){
	global.is_open_shopping_panel = false;
	
	//instance_destroy(self);
	del_instances_from_layer = layer_get_all_elements("shopping_panel_content");
	
	instance_destroy(self)
}
}
} else {
	global.escape_exercuted = false;	
}