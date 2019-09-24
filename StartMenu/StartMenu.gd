extends Node2D


func _ready() -> void:
	$Menu/NewGame.grab_focus()
	
	yield(get_tree().create_timer(2), "timeout")
	$FireParticles2.emitting = true
	$Smoke2.emitting = true
	
	yield(get_tree().create_timer(6), "timeout")
	$FireParticles1.emitting = true
	$Smoke1.emitting = true
	


func _on_NewGame_pressed() -> void:
	get_tree().change_scene("res://World.tscn")


func _on_Exit_pressed() -> void:
	get_tree().quit()


