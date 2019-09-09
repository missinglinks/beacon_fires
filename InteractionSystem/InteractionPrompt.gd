extends ColorRect

"""
Interaction Prompt
Shows a promt with the prompt label of the interactible object when
the interactor is near the object.
"""

func _ready():
	visible = false

func _on_Interactable_entered(body, interactible: Interactible):
	$Label.text = interactible.interaction_prompt
	get_parent().position = interactible.position
	visible = true
	
func _on_Interactable_exited(body, interactible: Interactible):
	visible = false