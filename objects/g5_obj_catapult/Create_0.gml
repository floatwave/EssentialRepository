/// @description Insert description here
// You can write your code in this editor

color = make_colour_rgb( 133, 96, 169 )
colorWarn = make_colour_rgb( 220, 0, 50 )
image_blend = color

maxCharge = 300

charging = false
angle = 0
grav = 0.9

anchor = y
for( var i = 0; i < room_height - y; i ++ ){

	anchor = y + i
	if place_meeting( x, anchor + 1, g5_obj_solid )
		break	
}
