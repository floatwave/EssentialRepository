/// @description Insert description here
// You can write your code in this editor

if charging {
	/*
	xHold = lengthdir_x( point_distance( x, y, mouse_x, mouse_y ), angle + 180 )
	yHold = lengthdir_y( point_distance( x, y, mouse_x, mouse_y ), angle + 180 )
	*/
	var width = min( 50 / ( point_distance( x, y, mouse_x, mouse_y ) / 10 ), 50 )
	draw_set_color( charge > maxCharge * ( 4 / 5 ) ?  colorWarn : color )
	var delta = charge > maxCharge * ( 4 / 5 ) ?  random_range( -2, 2 ) : 0
	draw_line_width( x + delta, y + delta, mouse_x + delta, mouse_y + delta , width )
	draw_circle( mouse_x + delta, mouse_y + delta, width / 2, false )


	for( var i = 0; i < 100; i ++ ){
	
		var dX = charge / 8 * i * dcos( angle )
		var dY = charge / 8 * i * dsin( angle ) - ( 0.5 * grav * i * i )
		
		draw_set_colour( c_gray )
		draw_circle( x + dX, y - dY, 2, false )
	}
}

draw_set_colour( c_gray )
draw_line_width( x, y, x, anchor + sprite_height / 2, 5 )

draw_self()