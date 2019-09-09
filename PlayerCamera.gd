extends Camera2D

onready var player = get_parent()

var _origin_zoom: Vector2 

export var zoom_factor: float = 0.5
export var zoom_time: float = 1

func _ready():
	_origin_zoom = zoom

func _process(delta):
	pass


func _on_Player_state_changed(new_state):
	match new_state.name:
		"Running":
			var target_zoom = _origin_zoom + _origin_zoom* zoom_factor
			$Tween.interpolate_property(self, "zoom", zoom, target_zoom, zoom_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
		"Idle":
			$Tween.interpolate_property(self, "zoom", zoom, _origin_zoom, zoom_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
