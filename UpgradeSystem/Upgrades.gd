extends Node

var upgrades = []
var current_upgrades = []

func _ready() -> void:
	randomize()
	reset()
	

func reset() -> void:
	upgrades = self.get_children()

func get_random_upgrade() -> Upgrade:
	var i = randi() % upgrades.size()
	return upgrades[i]

func remove_upgrade_from_pool(upgrade: Upgrade) -> void:
	var i = upgrades.find(upgrade)
	upgrades.remove(i)

func add_upgrade(upgrade: Upgrade) -> void:
	current_upgrades.append(upgrade)