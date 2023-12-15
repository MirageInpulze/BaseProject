/// @description Insert description here
// You can write your code in this editor

depth = -1
scale = 2
show_inv = false 

inv_slots = 32
inv_slots_per_row = 8
inv_row = 4

inv_width = 1186
inv_height = 633

gui_width = display_get_gui_width()
gui_height = display_get_gui_height()

inv_gui_scale = 0.15

inv_gui_x = (gui_width * 0.50) - (inv_width * inv_gui_scale * 0.25 * scale)
inv_gui_y = (gui_height * 0.50) - (inv_height * inv_gui_scale * 0.25 * scale)


slots_x = inv_gui_x + (53 * inv_gui_scale * scale)
slots_y = inv_gui_y + (53 * inv_gui_scale * scale)

inv_slot_buffer = (27 * inv_gui_scale * scale)

inv_slot_size = (111 * inv_gui_scale * scale)


//ds_inv = ds_grid_create(2, inv_slots)

//ds_inv[] 

global.playerInventory = new Inventory() 

//image_index+=1
//image_number=1

global.playerInventory.item_add("Axe", 1, sAxe)
global.playerInventory.item_add("Hoe", 1, sHoe)
global.playerInventory.item_add("Scythe", 1, sScythe)
global.playerInventory.item_add("Shovel", 1, sShovel)
global.playerInventory.item_add("Watering Can", 1, sWateringCan)


//global.playerInventory.item_add("Carot", 64*(32-5), sCarot)


//global.playerInventory.item_add("wood",45,)

//global.playerInventory.item_subtract("wood",2)

show_debug_message(global.playerInventory)

//repeat(inv_slots){
//}

global.itemChosen = global.playerInventory._inventory_items[0]












 