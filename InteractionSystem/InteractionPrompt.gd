extends ColorRect

"""
Interaction Prompt
Shows a promt with the prompt label of the interactible object when
the interactor is near the object.
"""

func _ready():
	visible = false

func _on_Interactable_entered(body, interactible: Interactible):
	if body.is_in_group("Player"):
		$Label.text = interactible.interaction_prompt
		get_parent().position = interactible.position + interactible.prompt_offset
		visible = true
	
func _on_Interactable_exited(body, interactible: Interactible):
	visible = false