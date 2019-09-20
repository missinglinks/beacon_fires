extends Node
class_name Upgrade

"""
Upgrade base class interface

Contains apply function to be overwritten by the specific upgrades
"""

var active: bool = true
var title: String = "Upgrade"
var description: String = "Description"

func apply() -> void:
	pass