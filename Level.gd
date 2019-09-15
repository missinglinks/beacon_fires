extends Node2D

#level configuration
export var block_h: int = 500

onready var interactor = get_node("../Player/Interactor")
onready var interactionPrompt = get_node("../InteractionSystem/InteractionPromptNode")
onready var beacon_fire = get_node("../BeaconFire")

#level elements
var top1 = preload("res://Levels/Grass/Blocks/Top1.tscn")
var start1 = preload("res://Levels/Block.tscn")
var block = preload("res://Levels/Block.tscn")



#var top_block = preload("res://Levels/TopBlock.tscn")
#var start_block = preload("res://Levels/StartBlock.tscn")

func _ready():
	print("ggggggggggggenerate level")
	generate_level()	
	
func generate_level():
	
	
	var y_start = 0
	var y_pos = y_start
	
	
	var s = start1.instance()
	s.position = Vector2(-250, y_start)
	s.z_index = -10
	$Blocks.add_child(s)	
	y_start -= block_h
	
	print("build level")
	print(GameState.level_blocks)
	
	for i in range(0, GameState.level_blocks-1):
		var b = block.instance()
		y_pos = y_start - (i * block_h)
		b.position = Vector2(-250, y_start - (i * block_h))
		$Blocks.add_child(b)
		
	y_pos -= block_h
	var t = top1.instance()
	t.position = Vector2(0, y_pos+250)
	t.z_index = -10
	$Blocks.add_child(t)
	
	
	beacon_fire.position = t.position + t.get_beacon_fire_position()
