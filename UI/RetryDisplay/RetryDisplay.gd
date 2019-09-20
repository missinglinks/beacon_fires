extends Control

var image = preload("res://UI/Sprites/icon_retry.png")
var icon = preload("res://UI/Elements/Icon.tscn")

onready var container = $Container

func _ready():
	for i in range(GameState.retries):
		var ic = icon.instance()
		container.add_child(ic)
		ic.set_image(image)

