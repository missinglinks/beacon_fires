extends Node

onready var cooldown_timer: Timer = $CooldownTimer
onready var player = get_parent().get_node("Player")

export var cooldown: float = 0.8
export var y_variance: float = 50
export var x_variance: float = 50

var explosion = preload("res://Obstacles/Explosion/Explosion.tscn")

export var spawn_lines: bool = true
export var spawn_path: bool = false
export var spawn_snake: bool = false


func _ready():
	cooldown_timer.wait_time = cooldown
	$LineTimer.start()
	

func spawn_line(y):
	var start_x = -250
	var end_x = 250
	var x = start_x
	while true:
		if x > 250:
			break
		
		var ex = explosion.instance()
		ex.position = Vector2(x, y)
		add_child(ex)
		yield(get_tree().create_timer(0.03), "timeout")
		x += 50
		

func _on_CooldownTimer_timeout():

	if player and spawn_path:
		var ex = explosion.instance()
		var x = player.position.x + player.motion.normalized().x * 150 + rand_range(-x_variance, +x_variance)
		x = clamp(x, -250, 250)
		var y = player.position.y + player.motion.normalized().y * 150 + rand_range(-x_variance, +x_variance)
		ex.position = Vector2(x, y)
		add_child(ex)
		ex.indication_time = 1
		
	if player and spawn_snake:
		var ex = explosion.instance()
		ex.position = player.position
		add_child(ex)
		ex.indication_time = 0.5		


func _on_LineTimer_timeout():
	if spawn_lines:
		spawn_line(player.position.y - rand_range(100, 250))
