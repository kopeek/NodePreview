
extends Node2D

func _ready() -> void:
	var image: Image = await $NodePreview.get_image()
	var texture: = ImageTexture.create_from_image(image)
	
	$NodePreview/TextureRect.texture = texture

func _physics_process(delta: float) -> void:
	var image: Image = await $NodePreview.get_image()
	var texture: = ImageTexture.create_from_image(image)
	
	$NodePreview/TextureRect.texture = texture
