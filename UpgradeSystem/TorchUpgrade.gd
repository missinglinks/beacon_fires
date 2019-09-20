extends Upgrade

func _ready():
	title = "Better torch"
	description = "Torches last 20 % longer"

func apply():
	PlayerStats.torch_time += 1.2