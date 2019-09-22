extends Control

onready var icon = preload("res://UI/Elements/Icon.tscn")
onready var grid: GridContainer = $Grid

func _ready() -> void:
	for upgrade in Upgrades.current_upgrades:
		var i = icon.instance()
		grid.add_child(i)
		i.set_image(upgrade.image)