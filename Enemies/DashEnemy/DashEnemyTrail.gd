extends Sprite

func _ready() -> void:
	$Tween.interpolate_property(
		self, 
		"modulate",  
		Color(1, 0, 1, 1), 
		Color(1, 0, 1, 0), 
		0.2, 
		Tween.TRANS_LINEAR, 
		Tween.EASE_OUT)
	$Tween.start()


func _on_Tween_tween_all_completed() -> void:
	queue_free()
