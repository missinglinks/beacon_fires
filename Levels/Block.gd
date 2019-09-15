extends Node2D

var ground_tex = preload("res://Levels/Grass/Sprites/grass_ground.png")
var border_left = preload("res://Levels/Grass/Sprites/grass_left.png")
var border_right = preload("res://Levels/Grass/Sprites/grass_right.png")


func _draw():
	pass
	#draw_rect(Rect2(Vector2(-500, 0), Vector2(500,500)), Color.yellow, false)
	#draw_rect(Rect2(Vector2(500, 0), Vector2(500,500)), Color.yellow, false)
	#draw_rect(Rect2(Vector2.ZERO, Vector2(500,500)), Color.red, false)

func _process(delta):
	update()

func _ready():
	$Ground/GroundTextureRect.texture = ground_tex
	$Borders/LeftCollision/Sprite.texture = border_left
	$Borders/RightCollision/Sprite.texture = border_right

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
