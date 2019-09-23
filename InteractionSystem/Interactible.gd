extends Node2D
class_name Interactible

"""
Interactible class

Base class for interatible objects. 
Set ups variables for interaction prompt and the action function 
(which should be overwritten in inherited classes)

The interactible object needs to have an Area2D/Collision node 
indicating the interactive area of the object.
"""

var prompt_offset: Vector2 = Vector2.ZERO
var interaction_prompt: String = "interact"
var is_disabled: bool = false
var activation_time: float = 0.75
var action_pressed: bool = false
var action_pressed_time: float = 0


func action() -> void:
	print("Item action")
	
	
func reset() -> void:
	Input.stop_joy_vibration(0)
	action_pressed = false
	action_pressed_time = 0
	

func action_pressed_start() -> void:
	action_pressed = true
	
	
func _process(delta: float) -> void:
	if action_pressed:
		action_pressed_time += delta
		
	if action_pressed_time > activation_time:
		reset()
		Input.start_joy_vibration(0, 0.0, 0.5, .15)
		action()