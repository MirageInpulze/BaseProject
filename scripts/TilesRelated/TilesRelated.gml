// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangeTile(chosen_layer, from_tile, to_tile, at_x, at_y){
	var lay_id = layer_get_id(chosen_layer);
	var map_id = layer_tilemap_get_id(lay_id);
	var i = tilemap_get_at_pixel(map_id, at_x, at_y)

	if(i == from_tile ){
		tilemap_set_at_pixel(map_id, to_tile, at_x, at_y);
	}
}

function CheckTile(chosen_layer, tile, at_x, at_y){
	var lay_id = layer_get_id(chosen_layer);
	var map_id = layer_tilemap_get_id(lay_id);
	var i = tilemap_get_at_pixel(map_id, at_x, at_y)

	if(i == tile ){
		return true;
	}
}