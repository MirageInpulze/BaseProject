/// @description Insert description here
// You can write your code in this editor

if (exp_point == -1) {
	draw_sprite_part(spr_simple_crops, 0, 6 * frame_width, 4 * frame_height, frame_width, frame_height, xx, yy)
} 
else {
	draw_sprite_part(sprite_id, 0, (sprite_num + spr_offset) * frame_width, (crop_type - types_offset) * frame_height, frame_width, frame_height, xx, yy)
}












