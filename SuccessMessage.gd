extends Control


func _process(delta):
	if GameState.level_succeeded and visible == false:
		_activate()

func _on_Exit_pressed():
	get_tree().quit()


func _on_Next_pressed():
	GameState.next_beacon()


func _activate():
	visible = true
	$ColorRect/VSplitContainer/HSplitContainer/Next.grab_focus()