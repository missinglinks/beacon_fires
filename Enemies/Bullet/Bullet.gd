extends Area2D

var speed: float = 200
var mode = "straight"
var move_dir = Vector2.ZERO
var lifetime = 5

func _ready():
	$Lifetime.wait_time = lifetime
	$Lifetime.start()
	
func _physics_process(delta):
	position += move_dir * speed * delta
	
func _process(delta):
	pass

func _on_Lifetime_timeout():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.name == "Player":
		GameState.level_failed()