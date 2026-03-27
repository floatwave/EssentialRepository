/// @description Insert description here
// You can write your code in this editor

rooms = [
	g1_rm_main,
	g2_rm_main,
	g3_rm_main
]

roomsDesc = [
	"Simple 2D",
	"2D w/ walls",
	"Platformer"
]

cols = 5
startX = 100
startY = 150
dX = 200
dY = 100

for( var i = 0; i < array_length( rooms ); i ++ ){
	var button = instance_create_layer( startX + dX * ( i % cols ), startY + dY * floor( i / cols ), "Instances", g0_obj_button )
	button.gameId = i + 1
	button.game = rooms[ i ]
	button.gameDesc = roomsDesc[ i ]
}