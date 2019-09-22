extends Upgrade

func _ready():
	image = preload("res://UI/Sprites/icon_player_move_upgrade.png")
	title = "Faster, faster"
	description = "Run 15 % faster"

func _apply():
	PlayerStats.move_speed * 1.15