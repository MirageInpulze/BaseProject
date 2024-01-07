/// @description Create parallax effect
// You can write your code in this editor

var _cam_x = camera_get_view_x(view_camera[0]);

layer_x("Backgrounds_cloud_near", _cam_x * 1.1);
layer_x("Backgrounds_hill", _cam_x * 1);
layer_x("Backgrounds_cloud_far", _cam_x * 1.05);
layer_x("Backgrounds_mountain_near", _cam_x * 1);
layer_x("Backgrounds_mountain_far", _cam_x * 1);
layer_x("Backgrounds_mountain_further", _cam_x * 1);
layer_x("Backgrounds_cloud_sky_0", _cam_x * 1.125);
layer_x("Backgrounds_cloud_sky_1", _cam_x * 1.075);

layer_x("Instances_game_title", _cam_x * 1);




