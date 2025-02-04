extends Node3D

func _ready() -> void:

	var image: Image = await $NodePreview.get_image()
	
	
	var texture: = ImageTexture.create_from_image(image)
	
	$CanvasLayer/Control/TextureRect.texture = texture
	await get_tree().create_timer(2).timeout
	$MeshInstance3D.position.z -= 1
	image = await $NodePreview.get_image()
	
	
	texture = ImageTexture.create_from_image(image)
	
	$CanvasLayer/Control/TextureRect.texture = texture
