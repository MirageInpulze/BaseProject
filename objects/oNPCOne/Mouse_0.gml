/// @description Insert description here
// You can write your code in this editor

if (!global.is_open_shopping_panel){
	global.shopping_panel_instance = instance_create_layer(camera_get_view_x(view_camera[0]) , camera_get_view_y(view_camera[0]) ,"shopping_panel", o_shopping_panel);
	global.is_open_shopping_panel = true;
}






