extends Node2D

var ground_tex = preload("res://Levels/Grass/Sprites/grass_ground.png")

var right_block = preload("res://Levels/Grass/Blocks/Right1.tscn")
var left_block = preload("res://Levels/Grass/Blocks/Left1.tscn")


func _draw() -> void:
	pass
	#draw_rect(Rect2(Vector2(-500, 0), Vector2(500,500)), Color.yellow, false)
	#draw_rect(Rect2(Vector2(500, 0), Vector2(500,500)), Color.yellow, false)
	#draw_rect(Rect2(Vector2.ZERO, Vector2(500,500)), Color.red, false)

func _process(delta: float) -> void:
	update()

func _ready():
	$Ground/GroundTextureRect.texture = ground_tex
	var l = left_block.instance()
	l.position = Vector2(-250, 250)
	l.z_index = 50
	add_child(l)
	var r = right_block.instance()
	r.position = Vector2(750, 250)
	r.z_index = 50
	add_child(r)
