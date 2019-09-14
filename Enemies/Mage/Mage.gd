extends KinematicBody2D

var bullet = preload("res://Enemies/Bullet/Bullet.tscn")

export var shoot_rot = 0.5
export var concurrent = 1
var current_rot 

func _ready():
	$Cooldown.start()
	current_rot = PI * 1.5


func _spawn_bullet(angle):
	var bul = bullet.instance()
	bul.move_dir = Vector2(cos(angle), -sin(angle))
	add_child(bul)

func _on_Cooldown_timeout():
	
	var start_dir = 2 * PI / concurrent
	for i in range(concurrent):		
		_spawn_bullet(current_rot + i * start_dir)
		
	current_rot = current_rot + shoot_rot
	if current_rot > 2*PI:
		current_rot -= 2* PI
