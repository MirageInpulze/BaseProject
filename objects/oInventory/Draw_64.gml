/// @description Insert description here
// You can write your code in this editor

if(global.chestOpened && !global.char_leave){
	exit
}

//global.char_leave = false

if(!show_inv){
	draw_sprite_ext(sInventory,1, inv_gui_x, gui_height*0.4-16, inv_gui_scale, inv_gui_scale, 0, c_white, 1)
	var ii = 0, xx, yy
	
	var loop = array_length(global.playerInventory._inventory_items)

	if(8 < array_length(global.playerInventory._inventory_items)){
		loop = 8
	}
	repeat(loop){
		xx = (inv_gui_x + 8) + ((ii)*16) + 5 * ii
		yy = (gui_height*0.4 + 8 + 8)
	
		if(global.itemChosen == global.playerInventory._inventory_items[ii]){
			draw_sprite_ext(global.playerInventory._inventory_items[ii].sprite, 0, xx, yy, 1.1, 1.1, 0, c_aqua, 1)
		}
		else{
			draw_sprite(global.playerInventory._inventory_items[ii].sprite, 0, xx, yy)
		}
	
		var qty = global.playerInventory._inventory_items[ii].quantity
		if(qty > 0){
			draw_text_transformed(xx,yy,string(qty),0.5,0.5,0)
		}
		ii += 1
	}
	
	exit
}


draw_sprite_ext(sInventory, 0, inv_gui_x, inv_gui_y, inv_gui_scale, inv_gui_scale, 0, c_white, 1)


var ii, ix, iy, xx, yy
ii = 0
ix = 0
iy = 0

var loop = array_length(global.playerInventory._inventory_items)

if(inv_slots < array_length(global.playerInventory._inventory_items)){
	loop = inv_slots
}

repeat(loop){
	
//	xx = slots_x + ((inv_slot_size + inv_slot_buffer) * ix * inv_gui_scale * scale)
//	yy = slots_y + ((inv_slot_size + inv_slot_buffer) * iy * inv_gui_scale * scale)

	xx = (inv_gui_x + 8) + ((ix)*16) + 5 * ix
	yy = (inv_gui_y + 8) + ((iy)*16) + 5 * iy
	
	
	draw_sprite(global.playerInventory._inventory_items[ii].sprite, 0, xx, yy)
	
	var qty = global.playerInventory._inventory_items[ii].quantity
	if(qty > 0){
		//draw_text(xx, yy, string(qty))
		//draw_text_color(xx, yy, string(qty), c_black, c_black,c_white,c_white,1)
		draw_text_transformed(xx,yy,string(qty),0.5,0.5,0)
	}
	
	ii += 1
	ix = ii mod inv_slots_per_row
	iy = ii div inv_slots_per_row
}


