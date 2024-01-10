/// @description Insert description here
// You can write your code in this editor
image_speed = 0

depth = -1
scale = 2
//show_inv = false

global.char_leave = false

inv_slots = 32
inv_slots_per_row = 8
inv_row = 4

inv_width = 1186
inv_height = 633

gui_width = display_get_gui_width()
gui_height = display_get_gui_height()

inv_gui_scale = 0.15

inv_gui_x = 0
inv_gui_y = (gui_height) - (inv_height * inv_gui_scale * 0.5 * scale) +4


slots_x = inv_gui_x + (53 * inv_gui_scale * scale)
slots_y = inv_gui_y + (53 * inv_gui_scale * scale)

inv_slot_buffer = (27 * inv_gui_scale * scale)

inv_slot_size = (111 * inv_gui_scale * scale)

global.player_chest1_collision = false 
global.chestOpened = false

//global.chestInventory1 = new Inventory() 

//global.chestInventory1.item_add("Wheat Seed", 64, sWheat)
//global.chestInventory1.item_add("Carot Seed", 64, sCarot)
//global.chestInventory1.item_add("Eggplant Seed", 64, sEggplant)
