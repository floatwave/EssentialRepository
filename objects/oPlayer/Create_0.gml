/// @description Insert description here
// You can write your code in this editor

moveSpeed = 6

xSpeed = 0
ySpeed = 0

horizontal = 0
vertical = 0

delta = .5

getControls = function(){

	rightKey = keyboard_check( vk_right ) or keyboard_check( ord( "D" ))
	leftKey = keyboard_check( vk_left ) or keyboard_check( ord( "A" ))
	upKey = keyboard_check( vk_up ) or keyboard_check( ord( "W" ))
	downKey = keyboard_check( vk_down ) or keyboard_check( ord( "S" ))

	horizontal = rightKey - leftKey
	vertical = downKey - upKey
}