extends Upgrade

func _ready():
	image = preload("res://UI/Sprites/icon_stumbling_immunity.png")
	title = "Graceful movement"
	description = "Never stumble over small objects"

func _apply():
	PlayerStats.cat_spawning_prob * 1.5