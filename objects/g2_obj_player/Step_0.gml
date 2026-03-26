/// @description Insert description here
// You can write your code in this editor

getControls()

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