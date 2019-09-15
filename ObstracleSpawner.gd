extends Node

onready var obstacle1 = preload("res://Obstacles/Obstacle1.tscn")
onready var player = get_node("../../../Player")

export var num_obstacles: int = 20

func _ready():
	print("spawn obstacles")
	randomize()
		
	print(GameState.level_height)
		
	for i in range(0, num_obstacles):
		var obstacle = obstacle1.instance()
		obstacle.position = Vector2(rand_range(-250, 250), rand_range(0, - GameState.level_height))
		obstacle.z_index = 4
		add_child(obstacle)
		var args = [ obstacle ]
		obstacle.connect("body_entered", player, "_on_Obstacle_body_entered", args)