extends Node2D

onready var indication_sprite = $Indicator
onready var indication_timer: Timer = $Indicator/IndicatorTimer

var indication_time = 0.5 setget set_indication_time

var _indication_phase: bool = true
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


func set_indication_time(t):
	indication_timer.stop()
	indication_timer.set_wait_time(t)
	indication_timer.start()
	indication_time = t
	_scale_reduction = 1 / indication_time

func _explode():
	#$DamageArea/CollisionShape2D.disabled = false
	$Explosion/ActivateExplosionDamage.start()
	$Explosion.visible = true
	$AnimationPlayer.play("explosion")
	


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
	

func _on_ActivateExplosionDamage_timeout():
	$DamageArea/CollisionShape2D.disabled =false
	$DamageArea.connect("body_entered", self, "_on_Body_entered", [])
