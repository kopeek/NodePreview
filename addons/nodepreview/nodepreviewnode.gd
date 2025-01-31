@icon("res://rysunek-1.svg")
extends Node
class_name NodePreview

@export_group("Capture")
@export var capture_sprite: Sprite2D
@export var capture_box: TextureRect
@export var custom_capture_box: Node
@export var capture_rect: Rect2i

@export_enum("Sprite2D", "TextureRect", "Custom Rect", "Custom Rect Data") var capture_type: int = 0
@export_subgroup("Offset")
@export var try_to_center: bool = false
@export var use_node_pivot_offset: bool = false

#@export var use_custom_offset: bool = false
#@export var custom_offset: Vector2

#@export_subgroup("Margins")
#@export var left_margin: int
#@export var right_margin: int
#@export var top_margin: int
#@export var bottom_margin: int



@export_group("SubViewport")
@export var custom_subViewport: SubViewport

@export_group("Camera")
@export var custom_camera_2D: Camera2D



func _ready() -> void:
	_make_sub_viewport()
	custom_subViewport.world_2d = get_tree().root.world_2d
	_make_camera_2D()
	_capture_box()
	

func _capture_box():
	match capture_type:
		0:
			_set_camera_and_viewport(capture_sprite)
		1:
			_set_camera_and_viewport(capture_box)
		2:
			_set_camera_and_viewport(custom_capture_box)
		3:
			custom_subViewport.size = capture_rect.size
			custom_camera_2D.position = capture_rect.position
			if try_to_center:
				custom_camera_2D.position += Vector2(capture_rect.size / 2)
			
	
func _set_camera_and_viewport(node: Node):
	custom_subViewport.size = node.get_rect().size
	custom_camera_2D.position = node.position
	if use_node_pivot_offset:
		custom_camera_2D.position += _try_to_get_offset(node)
	if try_to_center:
		custom_camera_2D.position += node.get_rect().size / 2
	
func _try_to_get_offset(node: Node):
	if node.get("offset") != null: return node.get("offset")
	if node.get("pivot_offset") != null: return node.get("pivot_offset")
	return Vector2(0,0)
	
func get_image():
	await RenderingServer.frame_post_draw
	var image: Image = custom_subViewport.get_viewport().get_texture().get_image()
	return image
	
func _make_sub_viewport():
	if custom_subViewport != null: return
	custom_subViewport = SubViewport.new()
	custom_subViewport.world_2d = get_tree().root.world_2d
	custom_subViewport.transparent_bg = true
	custom_subViewport.handle_input_locally = false
	custom_subViewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(custom_subViewport)

func _make_camera_2D():
	if custom_camera_2D != null: 
		custom_camera_2D.reparent(custom_subViewport)
		return
	custom_camera_2D = Camera2D.new()
	custom_subViewport.add_child(custom_camera_2D)
	
