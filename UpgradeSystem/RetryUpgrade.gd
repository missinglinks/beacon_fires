extends Upgrade

func _ready():
	image = preload("res://UI/Sprites/icon_retry_upgrade.png")
	title = "Once again"
	description = "Allows you to escape your fate once more"


func _apply() -> void:
	GameState.retries += 1

