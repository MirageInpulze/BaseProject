/// @description This is a helper function that plant the crop on the mouse location and only used for testing
// Shoud be modifed to match game mechanic
// Call the instance_create_crop() to plant the crop in a specific location
//TODO: if(room != rm_farm) {is_planting = false: exit};

if (room != rFarming) exit;


if (room == rFarming and keyboard_check_pressed(ord("P"))) {is_planting = !is_planting}

if(is_planting) {
	mx = mouse_x
	my = mouse_y
	
	if(mouse_wheel_up()) {selected_crop +=1}
	if(mouse_wheel_down()) {selected_crop -=1}
	if selected_crop > crop_num - 1 {selected_crop = 0}
	if selected_crop < 0 {selected_crop = crop_num - 1}

	
	if mouse_check_button_pressed(mb_left) {
		instance_create_crop(mx, my, selected_crop)
	}
}

//Testing grow_state  
if (keyboard_check_pressed(ord("G"))) {
	show_debug_message("called ")
	with(obj_crops_manager) {event_perform(ev_other, ev_user1)}
	
}
//test make crop dead
if (keyboard_check_pressed(ord("D"))) {
	make_crops_dead()
}

//test harvest many
if (keyboard_check_pressed(ord("E"))) {
	harvest_many(oPlayer.x, oPlayer.y, 1,1,1,1,1,1,1,1)
}

