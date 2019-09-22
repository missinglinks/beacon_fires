extends Node2D

onready var beacon_fire = get_node("../BeaconFire")
onready var shrine = get_node("../YSort/Shrine")

#level configuration
export var block_h: int = 500

#level elements
var top1 = preload("res://Levels/Grass/Blocks/Top1.tscn")
var start1 = preload("res://Levels/Block.tscn")
var block = preload("res://Levels/Block.tscn")


func _ready():
	generate_level()	
	
func generate_level():
	var y_start = 0
	var y_pos = y_start
		
	var s = start1.instance()
	
	s.position = Vector2(-250, y_start)
	s.z_index = -10
	$Blocks.add_child(s)	
	y_start -= block_h
	
	for i in range(0, GameState.level_blocks):
		var b = block.instance()
		y_pos = y_start - (i * block_h)
		b.position = Vector2(-250, y_start - (i * block_h))
		$Blocks.add_child(b)
		
	y_pos -= block_h
	var t = top1.instance()
	t.position = Vector2(0, y_pos+250)
	t.z_index = -10
	$Blocks.add_child(t)
	
	#set beacen 
	beacon_fire.position = t.position + t.get_beacon_fire_position()

	#set shrine
	y_pos = rand_range(-50, -GameState.level_height)
	var x_pos = rand_range(210, 240)
	if randi() % 2 == 0:
		x_pos *= -1
	shrine.position = Vector2(x_pos, y_pos)
	