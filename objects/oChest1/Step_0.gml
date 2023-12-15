/// @description Insert description here
// You can write your code in this editor

//player inventory

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

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
	
	
	if(mx > xx && mx < xx + 16 && my > yy && my < yy + 16){
		if(mouse_check_button_released(mb_left)){
			if(array_length(global.chestInventory1._inventory_items) < inv_slots){
				var ii_name = global.playerInventory._inventory_items[ii].name
				var ii_quantity = global.playerInventory._inventory_items[ii].quantity
				var ii_sprite = global.playerInventory._inventory_items[ii].sprite
				
				global.playerInventory.item_subtract(ii_name, ii_quantity)
				global.chestInventory1.item_add(ii_name, ii_quantity, ii_sprite)
			}
			else{
				show_debug_message("chest full")
				//NewTextBox("Chest full")
			}
		}
	
	}
			
	
	ii += 1
	ix = ii mod inv_slots_per_row
	iy = ii div inv_slots_per_row
}
	
	
//chest inventory

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
	
	if(mx > xx && mx < xx + 16 && my > yy && my < yy + 16){
		if(mouse_check_button_released(mb_left)){
			if(array_length(global.playerInventory._inventory_items) < inv_slots){
				var ii_name = global.chestInventory1._inventory_items[ii].name
				var ii_quantity = global.chestInventory1._inventory_items[ii].quantity
				var ii_sprite = global.chestInventory1._inventory_items[ii].sprite
				
				global.chestInventory1.item_subtract(ii_name, ii_quantity)
				global.playerInventory.item_add(ii_name, ii_quantity, ii_sprite)
			}
			else{
				show_debug_message("chest full")
				//NewTextBox("Chest full")
			}
		}
	
	}
	
	
	ii += 1
	ix = ii mod inv_slots_per_row
	iy = ii div inv_slots_per_row
}






