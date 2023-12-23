/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, id)) {
		
		draw_sprite(spr_buy_cancel_button_hover, image_index, x, y);
	} else {
		draw_self();
	}





draw_set_font(global.font);

draw_set_valign(fa_middle);

draw_set_halign(fa_middle);
draw_text_transformed_color(x+ sprite_width/2, y + sprite_height/2 + 1, "Buy" ,0.4,0.4,0, 32896,32896 ,4235519 ,4235519 , 1);




