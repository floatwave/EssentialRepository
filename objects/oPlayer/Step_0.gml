/// @description Insert description here
// You can write your code in this editor

getControls()

xSpeed = horizontal * moveSpeed

if place_meeting( x + xSpeed, y, oSolid ){
	xSpeed = 0
	while( ! place_meeting( x + xSpeed + delta * horizontal, y, oSolid ))
		xSpeed += delta * horizontal
}

hspeed = xSpeed

ySpeed = vertical * moveSpeed

if place_meeting( x, y + ySpeed, oSolid ){
	ySpeed = 0
	while( ! place_meeting( x, y + ySpeed + delta * vertical, oSolid ))
		ySpeed += delta * vertical
}

vspeed = ySpeed

speed = min( moveSpeed, speed )