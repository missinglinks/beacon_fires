extends Node2D

var ground_tex = preload("res://sprites/ground/ground1.png")

func _draw():
	draw_rect(Rect2(Vector2(-500, 0), Vector2(500,500)), Color.yellow, false)
	draw_rect(Rect2(Vector2(500, 0), Vector2(500,500)), Color.yellow, false)
	draw_rect(Rect2(Vector2.ZERO, Vector2(500,500)), Color.red, false)

func _process(delta):
	update()

func _ready():
	$Ground/GroundTextureRect.texture = ground_tex

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
