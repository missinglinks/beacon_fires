extends Node2D


func _ready() -> void:
	$Menu/NewGame.grab_focus()


func _on_NewGame_pressed() -> void:
	get_tree().change_scene("res://World.tscn")


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_FireTimer_timeout() -> void:
	$FireParticles.emitting = true
