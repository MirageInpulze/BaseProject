/// @description Insert description here
// You can write your code in this editor

if(global.char_leave){
	exit
}

if(global.player_chest1_collision){
	
	//player inventory
	draw_sprite_ext(sInventory, 0, inv_gui_x, 0, inv_gui_scale, inv_gui_scale, 0, c_white, 1)


	var ii, ix, iy, xx, yy
	ii = 0
	ix = 0
	iy = 0

	var loop = array_length(global.playerInventory._inventory_items)

	if(inv_slots < array_length(global.playerInventory._inventory_items)){
		loop = inv_slots
	}

	repeat(loop){

		xx = (inv_gui_x + 8) + ((ix)*16) + 5 * ix
		yy = (0 + 8) + ((iy)*16) + 5 * iy
	
		var scale_sprite = 1
		if(sprite_get_width(global.playerInventory._inventory_items[ii].sprite) != 16){
			scale_sprite = 16 / sprite_get_width(global.playerInventory._inventory_items[ii].sprite)
		}
	
		draw_sprite_ext(global.playerInventory._inventory_items[ii].sprite, 0, xx, yy, scale_sprite, scale_sprite, 0, c_white, 1)
		//draw_sprite(global.playerInventory._inventory_items[ii].sprite, 0, xx, yy)
	
		var qty = global.playerInventory._inventory_items[ii].quantity
		if(qty > 0){
			draw_set_font(fnt_text)
			//draw_text(xx, yy, string(qty))
			//draw_text_color(xx, yy, string(qty), c_black, c_black,c_white,c_white,1)
			draw_text_transformed(xx,yy,string(qty),0.5,0.5,0)
		}
	
		ii += 1
		ix = ii mod inv_slots_per_row
		iy = ii div inv_slots_per_row
	}
	
	//chest inventory
	draw_sprite_ext(sInventory, 0, inv_gui_x, inv_gui_y, inv_gui_scale, inv_gui_scale, 0, c_white, 1)

	ii = 0
	ix = 0
	iy = 0

	var loop = array_length(global.chestInventory1._inventory_items)

	if(inv_slots < array_length(global.chestInventory1._inventory_items)){
		loop = inv_slots
	}

	repeat(loop){

		xx = (inv_gui_x + 8) + ((ix)*16) + 5 * ix
		yy = (inv_gui_y + 8) + ((iy)*16) + 5 * iy
	
		var scale_sprite = 1
		if(sprite_get_width(global.chestInventory1._inventory_items[ii].sprite) != 16){
			scale_sprite = 16 / sprite_get_width(global.chestInventory1._inventory_items[ii].sprite)
		}
	
		draw_sprite_ext(global.chestInventory1._inventory_items[ii].sprite, 0, xx, yy, scale_sprite, scale_sprite, 0, c_white, 1)
		//draw_sprite(global.chestInventory1._inventory_items[ii].sprite, 0, xx, yy)
	
		var qty = global.chestInventory1._inventory_items[ii].quantity
		if(qty > 0){
			draw_set_font(fnt_text)
			//draw_text(xx, yy, string(qty))
			//draw_text_color(xx, yy, string(qty), c_black, c_black,c_white,c_white,1)
			draw_text_transformed(xx,yy,string(qty),0.5,0.5,0)
		}
	
		ii += 1
		ix = ii mod inv_slots_per_row
		iy = ii div inv_slots_per_row
	}
}




