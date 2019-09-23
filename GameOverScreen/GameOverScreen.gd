extends Control


func _ready() -> void:
	$RestartGame.grab_focus()
	$Panel/BeaconCount.text = "Beacons lit: " + String(GameState.beacons_lit)


func _on_ExitGame_pressed() -> void:
	get_tree().quit()


func _on_RestartGame_pressed() -> void:
	print("game restart")
	GameState.restart_game()
