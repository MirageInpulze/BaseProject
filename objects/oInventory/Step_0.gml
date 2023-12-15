/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("I"))){
	show_inv = !show_inv
//	NewTextBox("global.playerInventory")
}

if(!show_inv){

	if(keyboard_check_pressed(ord("1")) && array_length(global.playerInventory._inventory_items) >= 1){
		global.itemChosen = global.playerInventory._inventory_items[0]
		show_debug_message(global.itemChosen.name)
	}
	else if(keyboard_check_pressed(ord("2")) && array_length(global.playerInventory._inventory_items) >= 2){
		global.itemChosen = global.playerInventory._inventory_items[1]
		show_debug_message(global.itemChosen.name)
	}
	else if(keyboard_check_pressed(ord("3")) && array_length(global.playerInventory._inventory_items) >= 3){
		global.itemChosen = global.playerInventory._inventory_items[2]
		show_debug_message(global.itemChosen.name)
	}
	else if(keyboard_check_pressed(ord("4")) && array_length(global.playerInventory._inventory_items) >= 4){
		global.itemChosen = global.playerInventory._inventory_items[3]
		show_debug_message(global.itemChosen.name)
	}
	else if(keyboard_check_pressed(ord("5")) && array_length(global.playerInventory._inventory_items) >= 5){
		global.itemChosen = global.playerInventory._inventory_items[4]
		show_debug_message(global.itemChosen.name)
	}
	else if(keyboard_check_pressed(ord("6")) && array_length(global.playerInventory._inventory_items) >= 6){
		global.itemChosen = global.playerInventory._inventory_items[5]
		show_debug_message(global.itemChosen.name)
	}
	else if(keyboard_check_pressed(ord("7")) && array_length(global.playerInventory._inventory_items) >= 7){
		global.itemChosen = global.playerInventory._inventory_items[6]
		show_debug_message(global.itemChosen.name)
	}
	else if(keyboard_check_pressed(ord("8")) && array_length(global.playerInventory._inventory_items) >= 8){
		global.itemChosen = global.playerInventory._inventory_items[7]
		show_debug_message(global.itemChosen.name)
	}
	//show_debug_message(global.itemChosen.name)
	
	
}




if(show_inv){
	
	mousex = device_mouse_x_to_gui(0)
	mousey = device_mouse_y_to_gui(0)
}


