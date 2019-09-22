extends Button

var _text: String

func _ready() -> void:
	_text = text


func _on_MenuButton_focus_entered() -> void:
	text = "> " + _text


func _on_MenuButton_focus_exited() -> void:
	text = _text