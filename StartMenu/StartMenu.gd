extends Control


func _ready():
	$NewGame.grab_focus()


func _on_NewGame_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Exit_pressed():
	get_tree().quit()
