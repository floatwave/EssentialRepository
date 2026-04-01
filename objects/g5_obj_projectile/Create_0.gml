/// @description Insert description here
// You can write your code in this editor

depth = - instance_number( object_index )

initVelocity = 0
initAngle = 0

moving = true

time = 0
grav = 0.9

delta = .5

image_blend = make_color_hsv( ( time * 10 ) % 255, 255, 255 )