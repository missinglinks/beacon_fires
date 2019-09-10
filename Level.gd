extends Node2D

#level configuration
export var size: int = 3
export var block_h: int = 500



#level elements
var block = preload("res://Levels/Block.tscn")
#var top_block = preload("res://Levels/TopBlock.tscn")
#var start_block = preload("res://Levels/StartBlock.tscn")

func _ready():
	generate_level()	
	
func generate_level():
	var y = 0
	for i in range(0, size):
		var b = block.instance()
		b.position = Vector2(-250, y - (i * block_h))
		$Blocks.add_child(b)
		
		