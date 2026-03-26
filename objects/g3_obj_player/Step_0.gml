/// @description Insert description here
// You can write your code in this editor

getControls()

xSpeed = move * moveSpeed

if place_meeting( x + xSpeed, y, g3_obj_solid ){
	while( ! place_meeting( x + delta * sign( xSpeed ), y, g3_obj_solid ))
		x += delta * sign( xSpeed )
	xSpeed = 0
}
x += xSpeed


if onGround() {
	canJump = true
	canDoubleJump = true
	groundMemory = groundMemoryMax
}
else if groundMemory > 0 {
	groundMemory --
}
else
	canJump = false

if doubleJump {	
	if jumpKeyPressed {
		if canJump {
			canJump = false
			jumpHeld = jumpHoldMax
		}
		else if canDoubleJump{
			canDoubleJump = false
			jumpHeld = jumpHoldMax - 10
		}
	}
}
else {
	if jumpKeyPressed and canJump {
		canJump = false
		jumpHeld = jumpHoldMax
	}
}

if ! jumpKey or atCeiling()
	jumpHeld = 0
	
if jumpHeld > 0 {
	ySpeed = jumpSpeed
	jumpHeld --
}

ySpeed += grav
	
if jumpHeld == 0 {
	ySpeed += grav
}

if place_meeting( x, y + ySpeed, g3_obj_solid ){
		while( ! place_meeting( x, y + delta * sign( ySpeed ), g3_obj_solid ))
			y += delta * sign( ySpeed )
		ySpeed = 0
}
y += min( ySpeed, termVel )