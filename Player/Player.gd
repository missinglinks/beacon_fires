extends KinematicBody2D

# node references
onready var anim: = $Sprite/AnimationPlayer
onready var state_machine = $States

# movement variables
export var MAX_SPEED: = 400
export var ACCELERATION: = 1000

var motion: Vector2 = Vector2.ZERO
var direction: String = "up"
var input_on: bool = true

signal state_changed(new_state)

func _ready():
	pass


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


func move_player(axis, delta):
	#var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)

	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO
	
	
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	
	
func _on_States_state_machine_transition(new_state):
	emit_signal("state_changed", new_state)
	
	
func _on_Obstacle_body_entered(body, obstacle):
	state_machine.trigger_state(state_machine.states.Stumbling)

