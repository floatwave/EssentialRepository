// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function Speaker( _interactions ) constructor {

	allowed = true
	active = false
	phase = 0

	waitTimer = 0
	waitTime = 0
	waiting = false

	textColor = c_white
	textContent = ""
	text = ""

	writing = false
	scrollSpeed = 1
	atLetter = 1
	lettersShown = 0
	linesShown = []
	
	interactions = _interactions
	
	static setInteractions = function( _interactions ){
		interactions = _interactions
		reset()
		phase = 0
	}
	
	static reset = function(){
		waitTimer = 0
		waitTime = 0
		waiting = false
		
		textColor = c_white
		textContent = ""
		text = ""
	
		writing = false
		scrollSpeed = 1
		atLetter = 1
		lettersShown = 0
		linesShown = []
	}
	
	static step = function( ticked ){ 
		
		if true {
			if ticked /*phase == 0 and ! active or mouse_check_button_pressed( mb_left ) or keyboard_check_pressed( vk_enter )*/{
				if ! active {
					//oGameControl.actionsDisabled = true
					//phase = 0
					active = true
					if ! getLine()
						return true
				}
				else if waiting{
					waitTimer = waitTime
					waiting = false
				}
				else if writing
					lettersShown = string_length( textContent )
				else {
	
					if phase >= array_length( interactions ){
						breakDialogue()
						return true
					}
					var line = interactions[ phase ]
					
					if line.effectEnd != pointer_null
						line.effectEnd.run()
					
					if ! line.repeating
						phase ++
					if line.breaking{
						breakDialogue()
						return true
					}
					else
						if ! getLine()
							return true
				}/*
				else
					active = false*/
			}
	
			if waiting {
				if waitTimer == waitTime {
					waitTimer = 0
					waitTime = 0
					waiting = false
				}
				else
					waitTimer ++
			}
			else if writing {
				lettersShown = min( scrollSpeed * interactions[ phase ].scrollSpeed + lettersShown, string_length( textContent ))
				while( atLetter <= floor( lettersShown )){
					text = string_concat( text, string_char_at( textContent, atLetter ))
					atLetter ++
				}	
			}
	
			if active and atLetter > string_length( textContent ){
				writing = false
				checkNoInput()
			}	
		}
		
		return false
	}
	
	static draw = function(){
		
		if allowed and active{
			var xPos = window_get_width() / 2 - 350
			var yPos = 60
			draw_set_alpha( 0.8 )
			draw_set_color( c_black )
			draw_rectangle( window_get_width() / 2 - 400, 30, window_get_width() / 2 + 400, 200, false )
			draw_set_color( c_white )
			draw_set_alpha( 1 )
			for( var i = 0; i < array_length( linesShown ); i ++ ){
				var line = linesShown[ i ]
				var content = line.text
				if( i == array_length( linesShown ) - 1 )
					content = text
				draw_set_color( line.color )
				draw_text( xPos, yPos, content )
				xPos += line.width
				yPos += line.height
			}
		}
	}
	
	static getLine = function(){
		
		if phase >= array_length( interactions ){
			breakDialogue()
			//oGameControl.actionsDisabled = false
			return false
		}
		var line = interactions[ phase ]
		
		if line.effectBegin != pointer_null
			line.effectBegin.run()
		
		if ! line.noClear 
			array_delete( linesShown, 0, array_length( linesShown ))
		array_push( linesShown, line )
		textContent = line.text
		text = ""
		writing = true
		atLetter = 1
		lettersShown = 0
	
		if line.wait > 0 {
			waitTime = line.wait
			waitTimer = 0
			waiting = true
		}
		
		return true
	}

	static checkNoInput = function(){
		if( phase < array_length( interactions ) - 1 ){
			if interactions[ phase + 1 ].noInput {
				phase ++
				getLine()
			}
		}
	}
	
	static breakDialogue = function(){
		active = false
		//allowed = false
		reset()
	}
}


function Line( _text = "" ) constructor
{
    text = _text;
	color = c_white
	wait = 0
	scrollSpeed = 1
	noClear = false
	noInput = false
	breaking = false
	repeating = false
	shader = pointer_null
	effectBegin = pointer_null
	effectEnd = pointer_null
	self.getStringSize()
	
	static setColor = function( _color ){
        color = _color
		return self
    }
	
	static setWait = function( _wait ){
        wait = _wait
		return self
    }
	
	static setSpeed = function( _speed ){
        scrollSpeed = _speed
		return self
    }
	
	static setNoClear = function(){
        noClear = true
		return self
    }
	
	static setNoInput = function(){
        noInput = true
		return self
    }
	
	static setContinue = function(){
		noClear = true
		noInput = true
		return self
	}
	
	static setBreaking = function(){
        breaking = true
		return self
    }
	
	static setRepeating = function(){
        repeating = true
		return self
    }
	
	static setEffectBegin = function( _effect ){
        effectBegin = _effect
		return self
    }
	
	static setEffectEnd = function( _effect ){
        effectEnd = _effect
		return self
    }
	
	static getStringSize = function(){
		var last = array_last( string_split( text, "\r\n" ))
		width =  string_width( last )
		height = string_height( text ) - string_height( last )
	}
}

function SideEffect() constructor {

	static run = function(){
		return
	}
}

