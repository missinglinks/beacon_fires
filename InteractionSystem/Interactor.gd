extends Node

"""
Interactor 

Child of the player node.
Handles interaction input and triggers action if player is in range
of an interactible object.
"""


# interaction variables
var can_interact: bool = false
var interaction_target: Interactible = null

func _input(event) -> void:
	if GameState.input_on:
		if event.is_action_pressed("interact") and can_interact:
			Input.start_joy_vibration(0, 0.1, 0.0, interaction_target.activation_time)
			interaction_target.action_pressed_start()
		elif event.is_action_released("interact") and can_interact:
			interaction_target.reset()	


func _on_Interactable_entered(body, interaction_node: Interactible) -> void:
	if body.is_in_group("Player"):
		print("entered "+interaction_node.name)
		can_interact = true
		interaction_target = interaction_node
	
	
func _on_Interactable_exited(body, interaction_node) -> void:
	if interaction_target:
		if interaction_target.action_pressed:
			interaction_target.reset()
			
		can_interact = false
		interaction_target = null
