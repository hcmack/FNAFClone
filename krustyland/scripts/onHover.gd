extends TextureButton

@export var scene_path: String = "res://scenes/cameras.tscn"

var can_switch := false

func _ready():
	mouse_entered.connect(_on_mouse_entered)

	# Small delay before enabling hover
	await get_tree().create_timer(0.2).timeout
	can_switch = true

func _on_mouse_entered():
	if can_switch and scene_path != "":
		Scenemanager.change_scene(scene_path)
