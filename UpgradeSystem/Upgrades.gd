extends Node

var upgrades = []

func _ready():
	upgrades = self.get_children()
	
	print(PlayerStats.retries)
	upgrades[0].apply()
	print(PlayerStats.retries)