extends Interactible


func _ready():
	interaction_prompt = "pray"
	prompt_offset = Vector2(-45, - 45)

func action():
	print("prayed at shrine")
	GameState.activate_shrine()
	$ActivatedParticles.emitting = true
	$CollisionShape2D.disabled = true
	