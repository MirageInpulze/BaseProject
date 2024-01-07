/// @description Insert description here
// You can write your code in this editor

if(title_visible > 0)
{
	// Make title fall down from above
	draw_sprite(spr_game_title, 0, 10, -180 + 10 + 180 * title_visible);
	// Create pulsing effect using TRIGONOMETRY in RADIANCE muahahahaha
	draw_set_alpha(title_visible * abs(sin(get_timer() * 0.000001 * pi)));
	draw_sprite(spr_title, 0, 0, 0);
	draw_set_alpha(1.0);
}










