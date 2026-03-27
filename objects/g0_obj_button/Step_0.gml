/// @description Insert description here
// You can write your code in this editor

if collision_point( mouse_x, mouse_y, g0_obj_button, false, false ) == id{
	image_blend = c_ltgray
	if mouse_check_button_pressed( mb_left )
		room_goto( game )
}
else
	image_blend = c_white
	