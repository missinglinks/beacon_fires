extends Interactible


func _ready():
	interaction_prompt = "pray"
	prompt_offset = Vector2(-45, - 45)

func action():
	GameState.activate_shrine()
	$ActivatedParticles.emitting = true
	$CollisionShape2D.disabled = true
	is_disabled = true
	