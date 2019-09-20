extends ColorRect

onready var img: TextureRect = $TextureRect

func set_image(var image):
	img.texture = image
