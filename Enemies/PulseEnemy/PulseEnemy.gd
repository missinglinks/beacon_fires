extends Area2D

onready var anim: AnimationPlayer = $Sprite/AnimationPlayer

func _ready():
	anim.play("base")
