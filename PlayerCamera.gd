extends Camera2D

onready var player = get_parent()

var _origin_zoom: Vector2 


export var shake_power = 4
export var shake_time = 0.1
var is_shake = false
var cur_pos
var elapsedtime = 0

export var zoom_factor: float = 0.15
export var zoom_time: float = 1

func _ready():
	_origin_zoom = zoom

func _process(delta):
	if is_shake:
        shake(delta)    

"""
Add camera zoom in/out when player state changes:
Zoom out when running, return to original zoom when idle.
"""
func _on_Player_state_changed(new_state):
	match new_state.name:
		"Running":
			var target_zoom = _origin_zoom + _origin_zoom* zoom_factor
			$Tween.interpolate_property(self, "zoom", zoom, target_zoom, zoom_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
		"Idle":
			$Tween.interpolate_property(self, "zoom", zoom, _origin_zoom, zoom_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()

func trigger_shake():
	is_shake = true
	cur_pos = offset

func shake(delta):
    if elapsedtime<shake_time:
        offset =  Vector2(randf(), randf()) * shake_power
        elapsedtime += delta
    else:
        is_shake = false
        elapsedtime = 0
        offset = cur_pos    