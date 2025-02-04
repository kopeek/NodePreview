
extends Node2D

func _ready() -> void:
	var image: Image = await $NodePreview.get_image()
	var texture: = ImageTexture.create_from_image(image)
	
	$OutputBox.texture = texture
