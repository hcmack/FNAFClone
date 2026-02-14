extends Node2D

# The currently active camera node
var current_cam: Node2D = null

func _ready():
	# Optionally start in OfficeCam
	switch_camera("StageCam")

# Switch camera by Node2D name
func switch_camera(cam_name: String):
	# Hide all cameras
	for child in get_children():
		if child is Node2D and child.name != "UI":
			child.visible = false

	# Show selected camera
	var cam = get_node_or_null(cam_name)
	if cam:
		cam.visible = true
		current_cam = cam
