extends Path2D

onready var follow: PathFollow2D = $PathFollow2D

export var time: float = 5

var reverse: bool = false
var tween_finished: bool = true
var tween: Tween

"""
Setup tween that uses a tween to make the PathFollow2D node follow the path, 
and return to the original position after reaching the end of the path.
"""
func setup_tween() -> void:
	if reverse:
		tween.interpolate_property(follow, "unit_offset", 0.99, 0, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	else:
		tween.interpolate_property(follow, "unit_offset", 0, 0.99, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_completed")
	reverse = !reverse
	tween_finished = true

func _ready():
	tween = Tween.new()
	add_child(tween)

func _process(delta: float) -> void:
	if tween_finished:
		tween_finished = false
		setup_tween()

func _on_PulseEnemyBody_body_entered(body):
	if body.is_in_group("Player"):
		GameState.level_failed()
