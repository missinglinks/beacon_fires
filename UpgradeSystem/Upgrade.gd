extends Node
class_name Upgrade

"""
Upgrade base class interface
Contains apply function to be overwritten by the specific upgrades
"""

var active: bool = true
var image: Texture = null
var title: String = "Upgrade"
var description: String = "Description"


func _apply() -> void:
	pass

func apply() -> void:
	Upgrades.add_upgrade(self)
	GameState.upgrade_completed()
	_apply()