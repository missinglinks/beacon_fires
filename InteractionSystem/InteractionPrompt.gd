extends ColorRect

func _ready():
	visible = false

func _on_Interactable_entered(body, interactible: Interactible):
	$Label.text = interactible.interaction_prompt
	get_parent().position = interactible.position
	visible = true
	
func _on_Interactable_exited(body, interactible: Interactible):
	print("hide prompt")
	visible = false