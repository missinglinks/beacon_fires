extends Node2D

onready var indication_sprite = $Indicator
onready var indication_timer = $Indicator/IndicatorTimer

var _indication_phase = true
var _scale_reduction

func _ready():
	
	_scale_reduction = 1 / indication_timer.wait_time
	
	indication_timer.start()
	$DamageArea/CollisionShape2D.disabled = true
	$Explosion.visible = false


func _process(delta):
	if _indication_phase:
		var new_scale = indication_timer.time_left * _scale_reduction
		indication_sprite.scale = Vector2(new_scale, new_scale)


func _explode():
	$DamageArea/CollisionShape2D.disabled = false
	$Explosion.visible = true
	$AnimationPlayer.play("explosion")
	
	$DamageArea.connect("body_entered", self, "_on_Body_entered", [])

func _on_IndicatorTimer_timeout():
	_indication_phase = false
	indication_sprite.queue_free()
	_explode()


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Body_entered(body):
	if body.name == "Player":
		print("body entered explosion")
		GameState.level_failed()
	