/// @description Insert description here
// You can write your code in this editor

if ! moving
	exit

time ++

image_blend = make_color_hsv( ( time * 10 ) % 255, 255, 255 )

var xNew = xstart + initVelocity * time * dcos( initAngle )
var yNew = ystart - ( initVelocity * time * dsin( initAngle ) - ( 0.5 * grav * time * time ))


if place_meeting( xNew, yNew, g5_obj_solid ){
	
	var t = time - 1
	
	xMoments = abs( xNew - x ) * .5
	yMoments = abs( yNew - y ) * .5
	moments = max( xMoments, yMoments )
	
	for( var i = 0; i < moments; i ++ ){
	
		var tNew = t + i / moments
		var xTmp = xstart + initVelocity * tNew * dcos( initAngle )
		var yTmp = ystart - ( initVelocity * tNew * dsin( initAngle ) - ( 0.5 * grav * tNew * tNew ))
		
		if place_meeting( xTmp, yTmp, g5_obj_solid )
			break
		
		xNew = xTmp
		yNew = yTmp
	
		moving = false
		image_blend = c_gray
	}
}

x = xNew
y = yNew


if y > room_height + 50
	instance_destroy()

