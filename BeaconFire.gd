extends Interactible

var fire = preload("res://Effects/FireParticles.tscn")

onready var torch: Interactible = get_node("../Torch")

signal beacon_lit()

func _ready():
	$CollisionShape2D.disabled = true
	interaction_prompt = "light up"


func action():
	if torch.is_active and GameState.state != GameState.states.Retry:
		#light fire
		var f = fire.instance()
		f.scale = Vector2(6,6)
		f.position -= Vector2(0, -30)
		add_child(f)
		emit_signal("beacon_lit")
		
		#disable collisions
		$CollisionShape2D.disabled = true
		
		#set gamestate to succes
		GameState.state_machine._transition_to(GameState.states.Success)


func _on_Torch_torch_picked_up(active_time):
	$CollisionShape2D.disabled = false


func _on_Torch_torch_run_out():
	$CollisionShape2D.disabled = true


func _on_GameState_level_failed():
	$CollisionShape2D.disabled = true
