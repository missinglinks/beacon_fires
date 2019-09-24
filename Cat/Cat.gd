extends Interactible

onready var heart = preload("res://Cat/HeartEmote.tscn")

func _ready():
	interaction_prompt = "pet"
	prompt_offset = Vector2(-50,-40)

func action():
	var h = heart.instance()
	add_child(h)
	h.global_position = global_position - Vector2(10,20)
	print("congratulations, you are petting the cat")
	$CollisionShape2D.disabled = true
	$InteractionCooldown.start()

func _on_InteractionCooldown_timeout():
	$CollisionShape2D.disabled = false
