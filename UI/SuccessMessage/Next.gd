extends Button

var _text 

func _ready():
	_text = text
	


func _on_Next_focus_entered():
	text = ">" + _text


func _on_Next_focus_exited():
	text = _text
