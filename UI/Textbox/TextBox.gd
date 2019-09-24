extends Panel

export var line: String = "Oh god oh man oh god"

var timer: SceneTreeTimer
var text: String = ""

func _ready():
	yield(get_tree().create_timer(0.3), "timeout")
	
	for c in line:
		yield(get_tree().create_timer(0.1) , "timeout")
		text = text + c
		$MarginContainer/Label.text = text
		
	yield(get_tree().create_timer(1), "timeout")
	queue_free()
