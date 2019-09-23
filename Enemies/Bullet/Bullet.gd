extends Area2D

var speed: float = 200
var mode: String = "straight"
var move_dir: Vector2 = Vector2.ZERO
var lifetime: float = 5

func _ready() -> void:
	$Lifetime.wait_time = lifetime
	$Lifetime.start()
	
func _physics_process(delta: float) -> void:
	position += move_dir * speed * delta
	
func _process(delta: float) -> void:
	pass

func _on_Lifetime_timeout() -> void:
	queue_free()

func _on_Bullet_body_entered(body) -> void:
	if body.name == "Player":
		GameState.level_failed()
		queue_free()