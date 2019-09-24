extends Sprite

onready var anim: AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("float_up")


func _process(delta: float) -> void:
	pass


func _on_Timer_timeout():
	queue_free()
