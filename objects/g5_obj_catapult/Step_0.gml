/// @description Insert description here
// You can write your code in this editor


if mouse_check_button_pressed( mb_left ) and collision_point( mouse_x, mouse_y, id, false, false ) == id{
	charging = true
	angle = point_direction( mouse_x, mouse_y, x + sprite_width / 2, y + sprite_height / 2 )
}

if charging {
	angle = point_direction( mouse_x, mouse_y, x, y )
	charge = point_distance( mouse_x, mouse_y, x, y )
	
	if charge > maxCharge
		charging = false
}


if charging and ( mouse_check_button_released( mb_left )){
	charging = false
	var projectile = instance_create_layer( x, y, "Instances", g5_obj_projectile )
	projectile.initAngle = angle
	projectile.initVelocity = point_distance( mouse_x, mouse_y, x, y ) / 8
}