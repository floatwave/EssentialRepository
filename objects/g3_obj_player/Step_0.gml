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

if bouncy
	jumpKeyPressed = jumpKey

if onGround() {
	canJump = true
	canDoubleJump = true
	coyoteGround = coyoteGroundMax
}
else if coyoteGround > 0 {
	coyoteGround --
}
else
	canJump = false
	
if jumpKeyPressed
	coyoteJump = coyoteJumpMax
else if coyoteJump > 0
	coyoteJump --
	
if ! jumpKey or atCeiling()
	jumpHeld = 0

if doubleJump {	
	if jumpKeyPressed or coyoteJump > 0 {
		if canJump {
			coyoteJump = 0
			canJump = false
			jumpHeld = jumpHoldMax
		}
		else if canDoubleJump{
			coyoteJump = 0
			canDoubleJump = false
			jumpHeld = jumpHoldMax - 10
		}
	}
}
else {
	if ( jumpKeyPressed or coyoteJump > 0 ) and canJump {
		coyoteJump = 0
		canJump = false
		jumpHeld = jumpHoldMax
	}
}

	
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