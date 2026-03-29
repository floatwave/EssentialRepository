/// @description Insert description here
// You can write your code in this editor

move = 0
jumpHeld = 0

xSpeed = 0
ySpeed = 0

delta = .5
moveSpeed = 4

grav = 0.25
termVel = 10

jumpSpeed = -6.5
jumpHoldMax = 30

canJump = false
doubleJump = false
canDoubleJump = false
bouncy = false

coyoteGround = 0
coyoteGroundMax = 8
coyoteJump = 0
coyoteJumpMax = 8


getControls = function(){

	rightKey = keyboard_check( vk_right ) or keyboard_check( ord( "D" ))
	leftKey = keyboard_check( vk_left ) or keyboard_check( ord( "A" ))
	jumpKeyPressed = keyboard_check_pressed( vk_space ) or keyboard_check_pressed( vk_up ) or keyboard_check_pressed( ord( "W" ))
	jumpKey = keyboard_check( vk_space ) or keyboard_check( vk_up ) or keyboard_check( ord( "W" ))
	move = rightKey - leftKey
	doubleJump = keyboard_check_pressed( ord( "X" )) xor doubleJump
	bouncy = keyboard_check_pressed( ord( "Z" )) xor bouncy
}

onGround = function(){
	return place_meeting( x, y + 1, g3_obj_solid )
}

atCeiling = function(){
	return place_meeting( x, y - 1, g3_obj_solid )
}