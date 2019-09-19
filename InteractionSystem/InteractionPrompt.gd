extends ColorRect

"""
Interaction Prompt
Shows a promt with the prompt label of the interactible object when
the interactor is near the object.
"""

var interactible: Interactible

func _ready():
	visible = false
	$Border.visible = false


func _process(delta):
	if  visible:
		if interactible.action_pressed_time > 0:
			$Label.visible = false
			$Border.visible = true
			$Border/Border2.rect_size = Vector2(50 * (interactible.action_pressed_time/interactible.activation_time), 10)
		else:
			$Border.visible = false
			$Label.visible = true

func _on_Interactable_entered(body, interactible: Interactible):
	if body.is_in_group("Player"):
		self.interactible = interactible
		$Label.text = interactible.interaction_prompt
		get_parent().position = interactible.position + interactible.prompt_offset
		visible = true
	
func _on_Interactable_exited(body, interactible: Interactible):
	visible = false
	self.interactible = null
	
