extends KinematicBody2D

# node references
onready var anim: = $Sprite/AnimationPlayer
onready var state_machine = $States

export var player_speed: float = 400
export var acceleration: float  = 1000

var motion: Vector2 = Vector2.ZERO
var direction: String = "up"
var input_on: bool = true

signal state_changed(new_state)
signal enter_action_area()
signal leave_action_area()


func _process(delta):
	if GameState.state == GameState.states.Init and (position.y < 0 and position.y > - GameState.level_height):
		GameState.state_machine._transition_to(GameState.states.Action)
	elif GameState.state == GameState.states.Action and position.y < -GameState.level_height:
		GameState.state_machine._transition_to(GameState.states.Init)
	

"""
Return current controller input axis, and sets player looking direction
accordingly.
"""
func get_input_axis():	
	var axis = Vector2.ZERO
	if input_on:
		axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		
	if axis != Vector2.ZERO:
		
		if axis.x < -0.5:
			direction = "left"
		elif axis.x > 0.5:
			direction = "right"
		else:
			if axis.y < 0:
				direction = "up"
			else:
				direction ="down"

	return axis.normalized()


"""
Moves player by applying friction and acceleration
"""
func move_player(axis, delta):
	#var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(acceleration * delta)
	else:
		apply_movement(axis * acceleration * delta)
	
	motion = move_and_slide(motion)

	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO
	
	
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(player_speed)


"""
Emit signal when player state changes
"""
func _on_States_state_machine_transition(new_state):
	emit_signal("state_changed", new_state)


"""
Force state change to 'Stumbling', when player hits an 'Obstacle'
"""
func _on_Obstacle_body_entered(body, obstacle):
	state_machine.trigger_state(state_machine.states.Stumbling)
