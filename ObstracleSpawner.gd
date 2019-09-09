extends Node

onready var obstacle1 = preload("res://Obstacles/Obstacle1.tscn")
onready var player = get_node("../../Player")

export var numObstacles: int = 20

func _ready():
	print("spawn obstacles")
	randomize()
	
	for i in range(0, numObstacles):
		var obstacle = obstacle1.instance()
		obstacle.position = Vector2(rand_range(-100, 150), rand_range(-200, -2000))
		obstacle.z_index = 4
		add_child(obstacle)
		var args = [ obstacle ]
		obstacle.connect("body_entered", player, "_on_Obstacle_body_entered", args)