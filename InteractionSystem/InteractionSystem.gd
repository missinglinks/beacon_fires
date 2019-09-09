extends Node

func _ready():
	#var player = get_node("../Player")
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