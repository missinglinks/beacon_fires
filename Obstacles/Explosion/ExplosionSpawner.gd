extends Node

onready var cooldown_timer: Timer = $CooldownTimer

export var cooldown: float = 0.4
export var y_variance: float = 50
export var x_variance: float = 50

var explosion = preload("res://Obstacles/Explosion/Explosion.tscn")

func _ready():
	cooldown_timer.wait_time = cooldown

func _on_CooldownTimer_timeout():
	var player = get_parent().get_node("Player")
	if player:
		var ex = explosion.instance()
		
		var x = player.position.x + player.motion.normalized().x * 150 + rand_range(-x_variance, +x_variance)
		x = clamp(x, -250, 250)
		var y = player.position.y + player.motion.normalized().y * 150 + rand_range(-x_variance, +x_variance)
		ex.position = Vector2(x, y)
		add_child(ex)
