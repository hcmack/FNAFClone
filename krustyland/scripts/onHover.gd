extends TextureButton

@export var scene_path: String = "res://scenes/cameras.tscn"

func _ready():
	# Connect signals to local methods using Callables
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	if scene_path != "":
		Scenemanager.change_scene(scene_path)

func _on_mouse_exited():
	pass  
