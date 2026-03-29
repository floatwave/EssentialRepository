/// @description Insert description here
// You can write your code in this editor

rooms = [
	{ name : g1_rm_main, desc : "Simple 2D" },
	{ name : g2_rm_main, desc : "2D w/ walls" },
	{ name : g3_rm_main, desc : "Platformer" }
]

cols = 5
startX = 100
startY = 150
dX = 200
dY = 100

for( var i = 0; i < array_length( rooms ); i ++ ){
	var button = instance_create_layer( startX + dX * ( i % cols ), startY + dY * floor( i / cols ), "Instances", g0_obj_button )
	button.gameId = i + 1
	button.game = rooms[ i ].name
	button.gameDesc = rooms[ i ].desc
}