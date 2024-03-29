extends Interactible

"""
"""

onready var torch: Interactible = get_node("../Torch")

var fire = preload("res://Effects/FireParticles.tscn")

signal beacon_lit()

func _ready() -> void:
	$CollisionShape2D.disabled = true
	
	prompt_offset = Vector2(-60, -30)
	interaction_prompt = "light up"


func action() -> void:
	if torch.is_active and GameState.state != GameState.states.Retry:
		var f = fire.instance()
		f.scale = Vector2(6,6)
		f.position -= Vector2(0, -30)
		add_child(f)
		emit_signal("beacon_lit")
		
		#disable collisions
		$CollisionShape2D.disabled = true
		
		GameState.level_succeeded()


func _on_Torch_torch_picked_up(active_time: float) -> void:
	$CollisionShape2D.disabled = false


func _on_Torch_torch_run_out() -> void:
	$CollisionShape2D.disabled = true


func _on_GameState_level_failed() -> void:
	$CollisionShape2D.disabled = true
