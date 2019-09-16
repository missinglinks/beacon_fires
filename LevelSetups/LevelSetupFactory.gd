extends Node2D

var levels = [
	preload("res://LevelSetups/Level1.tscn"),
	preload("res://LevelSetups/Level2.tscn"),
	preload("res://LevelSetups/Level3.tscn"),
	preload("res://LevelSetups/Level4.tscn"),
	preload("res://LevelSetups/Level5.tscn"),
	preload("res://LevelSetups/Level6.tscn"),
	preload("res://LevelSetups/Level7.tscn"),
	preload("res://LevelSetups/Level8.tscn")
]

func _ready():
	randomize()
	var lv = get_random_level()
	var i = lv.instance()
	add_child(i)

func get_random_level():
	var i = randi() % levels.size()
	return levels[i]