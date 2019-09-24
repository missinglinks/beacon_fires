extends Upgrade

func _ready():
	image = preload("res://UI/Sprites/icon_torch_upgrade.png")
	title = "Better torch"
	description = "Torches last 20 % longer"

func _apply():
	PlayerStats.torch_time *= 1.2