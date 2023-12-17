if (y < global.shoppingPanelEnd && y > global.shoppingPanelStart) {
	//sprite_index = 0;
	//draw_self()
	draw_self();
	if (position_meeting(mouse_x, mouse_y, id)) {
		if (!global.is_open_shopping_pop_up){
			draw_sprite(spr_shop_row_hover, image_index, x, y);
		}
	} else {
		draw_self();
	}
}

if (y < global.shoppingPanelEnd && y > global.shoppingPanelStart){
draw_sprite_ext(currentSeedInstance.sprite_index, currentSeedInstance.image_index, x+13, y + sprite_height/4 - 1.5 , 0.6,0.6,0,c_white,1);
draw_set_font(global.font)

draw_set_valign(fa_middle);

draw_set_halign(fa_left);
draw_text_transformed_color(x+37, y + sprite_height/2 + 1, currentSeedInstance.name,0.6,0.6,0, 32896,32896 ,4235519 ,4235519 , 1);

draw_set_halign(fa_right);

draw_text_transformed_color( x+ sprite_width - 27, y + sprite_height/2 + 1 , currentSeedInstance.price,0.6,0.6,0, 32896,32896 ,4235519 ,4235519 , 1);
draw_sprite_ext(spr_gold, 0, x+ sprite_width - 25, y + sprite_height/4 - 0.5 ,0.6,0.6,0,c_white,1)
}