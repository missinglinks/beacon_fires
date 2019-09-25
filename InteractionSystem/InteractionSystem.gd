extends Node2D

"""
The interaction system consists of 4 parts:
	* InteractionSystem: connects all interactible items with the interactor
	* Interactor: the node that can interact with items
	* Interactible: nodes that can be interacted with
	* InteractionPrompt: on-screen prompt indicating the current interaction
"""


func _ready() -> void:
	var player = GameState.player
	if player:
		var interactor = player.get_node("Interactor")
		var interaction_prompt = $InteractionPromptNode
		interaction_prompt.visible = false
		
		var interactibles = get_tree().get_nodes_in_group("Interactible")
		for node in interactibles:
			var args = [ node ]
			node.connect("body_entered", interactor, "_on_Interactable_entered", args)
			node.connect("body_entered", interaction_prompt, "_on_Interactable_entered", args)
			node.connect("body_exited", interactor, "_on_Interactable_exited", args)
			node.connect("body_exited", interaction_prompt, "_on_Interactable_exited", args)