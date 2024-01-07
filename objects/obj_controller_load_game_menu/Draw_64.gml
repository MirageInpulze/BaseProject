/// @description Draw save data
// You can write your code in this editor


for(var _slot = 0; _slot < 3; _slot++)
{
	var _x = 10;
	var _y = 10 + _slot * 40;
	// Draw data
	
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	if(slot_data[_slot] == -1) //Empty save slot
	{
		draw_text(_x + 15 , _y + 12, "Empty save");
	}
	else
	{
		draw_text(_x + 15, _y + 5, "Character name:");
		draw_text(_x + 15, _y + 18, "Farm name:");
		draw_text(_x + 110, _y + 5, slot_data[_slot][? "character_name"]);
		draw_text(_x + 110, _y + 18, slot_data[_slot][? "farm_name"]);
		draw_text(_x + 200, _y + 5, "Money:");
		draw_text(_x + 240, _y + 5, slot_data[_slot][? "currentMoney"]);
	}
	
	draw_set_alpha(1.0);
}








