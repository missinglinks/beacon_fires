extends Upgrade

func _ready():
	title = "Faster, faster"
	description = "Run 15 % faster"

func apply():
	PlayerStats.move_speed * 1.15