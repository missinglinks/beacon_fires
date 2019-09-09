extends Interactible

onready var torch: Interactible = get_node("../Torch")

signal beacon_lit()

func _ready():
	$Area2D/CollisionShape2D.disabled = true
	interaction_prompt = "light up"


func action():
	if torch.is_active:
		print("beacon fire lit")
		emit_signal("beacon_lit")
		GameState.level_succeeded()
		$Area2D/CollisionShape2D.disabled = true
	else:
		print("cannot light beacon fire")


func _on_Torch_torch_picked_up(active_time):
	$Area2D/CollisionShape2D.disabled = false


func _on_Torch_torch_run_out():
	$Area2D/CollisionShape2D.disabled = true
