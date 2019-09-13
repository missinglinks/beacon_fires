extends Node

var dash_enemy = preload("res://Enemies/DashEnemy/DashEnemy.tscn")

export var num_enemies: int = 5

func _ready():
	var spacing = GameState.level_height / num_enemies+1
	for i in range(num_enemies):
		var y = - (i) * spacing
		var position = Vector2(rand_range(-250, 250), rand_range(y - 50, y + 50))
		var enemy = dash_enemy.instance()
		enemy.position = position
		add_child(enemy)
	