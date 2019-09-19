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

func _input(event):	
	if event.is_action_pressed("interact") and can_interact:
		interaction_target.action()


func _on_Interactable_entered(body, interaction_node: Interactible):
	print("entered "+interaction_node.name)
	can_interact = true
	interaction_target = interaction_node
	
	
func _on_Interactable_exited(body, interaction_node):
	can_interact = false
	interaction_target = null