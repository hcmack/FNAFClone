extends TextureButton

@export var cam_name: String

func _pressed():
	get_tree().current_scene.switch_camera(cam_name)
