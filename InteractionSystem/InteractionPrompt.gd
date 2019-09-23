extends MarginContainer

"""
Interaction Prompt
Shows a promt with the prompt label of the interactible object when
the interactor is near the object.
"""

var interactible: Interactible

func _ready() -> void:
	visible = false
	$ButtonPressedBar/Border.visible = false


func _process(delta: float) -> void:
	if  visible:
		if interactible.action_pressed_time > 0:
			$Label.visible = false
			$ButtonPressedBar/Border.visible = true
			$ButtonPressedBar/Border/Border2.rect_size = Vector2(50 * (interactible.action_pressed_time/interactible.activation_time), 10)
		else:
			$ButtonPressedBar/Border.visible = false
			$Label.visible = true

func _on_Interactable_entered(body, interactible: Interactible) -> void:
	if body.is_in_group("Player"):
		self.interactible = interactible
		$Label.text = interactible.interaction_prompt
		rect_position = interactible.position + interactible.prompt_offset
		visible = true
	
func _on_Interactable_exited(body, interactible: Interactible) -> void:
	visible = false
	self.interactible = null
	
