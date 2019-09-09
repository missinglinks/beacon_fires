extends Control


func _on_Exit_pressed():
	get_tree().quit()


func _on_Next_pressed():
	Engine.set_time_scale(1)
	get_tree().reload_current_scene()


func _on_GameState_level_succeeded():
	visible = true
	$ColorRect/VSplitContainer/HSplitContainer/Next.grab_focus()