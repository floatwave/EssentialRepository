/// @description Insert description here
// You can write your code in this editor

activated = false
done = false
ticked = false

interactions = [
	new Line( "These bushes bloom in all kinds of different colors." ),
	new Line( "Red,  " ).setColor( c_red ),
	new Line( "orange,  " ).setColor( c_orange ).setContinue(),
	new Line( "purple...  " ).setColor( c_purple ).setContinue(),
	new Line( "any color you can imagine." ).setWait( 20 ).setContinue(),
	new Line( @"And if you pick the flower 
a different kind might bloom in its place." ),

	new Line( "Do you think you could find a  " ).setWait( 30 ),
	new Line( "blue  " ).setColor( c_blue ).setContinue(),
	new Line( "one for me?").setContinue(),
	new Line( @"The blue coloring contains a chemical
that is said to cure any illness." ),
	new Line( @"Unfortunately I am too sick to find one myself.
Thank you." ).setBreaking(),
	
	new Line( "You haven't found it yet?" ),
	new Line( "That's okay.  It's bound to bloom sooner or later." ).setBreaking(),
	
	new Line( "I don't think I can hold on for much longer." ).setSpeed( 0.5 ),
	new Line( "Don't be sad.  You tried your best." ).setSpeed( 0.2 ).setEffectEnd( new Destroy( id ) )
]

speaker = new Speaker( interactions )

function tick( interact ){
	
	if ! activated and done
		activated = true

	ticked = interact
}

function Destroy( me ) : SideEffect() constructor {

	this = me
	
	static run = function(){
		with this { instance_destroy() }
	}
}