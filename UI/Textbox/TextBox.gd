extends Panel

export var line: String = ""
export var write_speed: float = 0.05

var timer: SceneTreeTimer
var text: String = ""

func _ready():
	yield(get_tree().create_timer(0.3), "timeout")
	
	for c in line:
		yield(get_tree().create_timer(write_speed) , "timeout")
		text = text + c
		$MarginContainer/Label.text = text
		
	yield(get_tree().create_timer(1), "timeout")
	queue_free()
