/// @description Insert description here
// You can write your code in this editor

moveSpeed = 6

xSpeed = 0
ySpeed = 0

horizontal = 0
vertical = 0

delta = .5

interact = false
interacting = false

getControls = function(){

	rightKey = keyboard_check( vk_right ) or keyboard_check( ord( "D" ))
	leftKey = keyboard_check( vk_left ) or keyboard_check( ord( "A" ))
	upKey = keyboard_check( vk_up ) or keyboard_check( ord( "W" ))
	downKey = keyboard_check( vk_down ) or keyboard_check( ord( "S" ))

	horizontal = rightKey - leftKey
	vertical = downKey - upKey
	
	interact = keyboard_check_pressed( vk_enter )

}

processMovement = function(){

	xSpeed = horizontal * moveSpeed

	if place_meeting( x + xSpeed, y, g2_obj_solid ){
		xSpeed = 0
		while( ! place_meeting( x + xSpeed + delta * horizontal, y, g2_obj_solid ))
			xSpeed += delta * horizontal
	}

	hspeed = xSpeed

	ySpeed = vertical * moveSpeed

	if place_meeting( x, y + ySpeed, g2_obj_solid ){
		ySpeed = 0
		while( ! place_meeting( x, y + ySpeed + delta * vertical, g2_obj_solid ))
			ySpeed += delta * vertical
	}

	vspeed = ySpeed

	speed = min( moveSpeed, speed )
}