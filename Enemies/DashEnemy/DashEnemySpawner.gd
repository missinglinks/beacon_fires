extends Node

var dash_enemy = preload("res://Enemies/DashEnemy/DashEnemy.tscn")

export var num_enemies: int = 5

func _ready() -> void:
	if num_enemies > 0:
		var spacing: float = GameState.level_height / num_enemies+1
		for i in range(num_enemies):
			var y: float = - (i) * spacing
			var position: Vector2 = Vector2(rand_range(-250, 250), rand_range(y - 30, y + 30))
			var enemy = dash_enemy.instance()
			enemy.position = position
			add_child(enemy)
	