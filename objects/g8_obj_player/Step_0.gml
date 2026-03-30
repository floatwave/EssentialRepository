/// @description Insert description here
// You can write your code in this editor

getControls()

if ( interact or interacting ) and place_meeting( x, y, g8_obj_speaker ){

	var speaker = instance_place( x, y, g8_obj_speaker )
	speaker.tick( interact )
	interacting = ! speaker.done
}
else if interacting and ! place_meeting( x, y, g8_obj_speaker )
	interacting = false
else
	processMovement()
	
