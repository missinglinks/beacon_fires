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
var show_prompt: bool = true
var activation_time = 0.75
var action_pressed: bool = false
var action_pressed_time: float = 0


func action():
	print("Item action")
	
func reset():
	action_pressed = false
	action_pressed_time = 0
	

func action_pressed_start():
	action_pressed = true
	
	
func _process(delta):
	if action_pressed:
		action_pressed_time += delta
		
	if action_pressed_time > activation_time:
		action()
		reset()