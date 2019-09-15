extends Node2D

func _draw():
	draw_rect(Rect2(Vector2(-250, 0), Vector2(GameState.level_width, -GameState.level_height)), Color.red, false)
	
func _process(delta):
	update()
