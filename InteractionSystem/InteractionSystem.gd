extends Node

"""
The interaction system consists of 4 parts:
	* InteractionSystem: connects all interactible items with the interactor
	* Interactor: the node that can interact with items
	* Interactible: nodes that can be interacted with
	* InteractionPrompt: on-screen prompt indicating the current interaction
"""

func _ready():
	var interactor = get_node("../Player/Interactor")
	var interactionPrompt = $InteractionPromptNode/InteractionPrompt
	
	var interactibles = get_tree().get_nodes_in_group("Interactible")
	for node in interactibles:
		var interactionArea: Area2D = node.get_node("Area2D")
		var args = [ node ]
		interactionArea.connect("body_entered", interactor, "_on_Interactable_entered", args)
		interactionArea.connect("body_entered", interactionPrompt, "_on_Interactable_entered", args)
		interactionArea.connect("body_exited", interactor, "_on_Interactable_exited", args)
		interactionArea.connect("body_exited", interactionPrompt, "_on_Interactable_exited", args)