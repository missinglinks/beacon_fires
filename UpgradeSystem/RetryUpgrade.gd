extends Upgrade

func _ready():
	title = "Once again"
	description = "Allows you to escape your fate once more"


func apply():
	PlayerStats.retries += 1

