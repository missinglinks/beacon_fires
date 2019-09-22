extends Upgrade

func _ready():
	image = preload("res://UI/Sprites/icon_cat_prob.png")
	title = "Cat person"
	description = "Greatly improves chance of meeting cats"

func _apply():
	PlayerStats.cat_spawning_prob * 1.5