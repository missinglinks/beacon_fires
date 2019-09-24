extends Node

onready var textbox = preload("res://UI/Textbox/TextBox.tscn")

export (String, MULTILINE)  var messages 
export (NodePath) var host_path

var lines = []
var host: Node

func _ready() -> void:
	randomize()
	host = get_node(host_path)
	
	lines = messages.split("\n")
	yield(get_tree().create_timer(rand_range(2,4)), "timeout")
	
	var i: int = randi() % lines.size()
	var tb = textbox.instance()
	tb.line = lines[i]
	host.add_child(tb)
	tb.rect_position -= Vector2(0, 40)
	
	