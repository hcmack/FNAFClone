extends Node

var current_scene: Node = null

func change_scene(scene_path: String):
	# Free old scene if it exists
	if current_scene:
		current_scene.queue_free()

	# Free the current scene in the tree if it exists
	var old_scene = get_tree().get_current_scene()
	if old_scene:
		old_scene.queue_free()

	# Load the new scene
	current_scene = load(scene_path).instantiate()

	# Set it as the main current scene
	get_tree().set_current_scene(current_scene)
	get_tree().root.add_child(current_scene)
