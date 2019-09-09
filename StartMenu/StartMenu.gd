extends Control


func _ready():
	$StartGameButton.grab_focus()

func _on_StartGameButton_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
