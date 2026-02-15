extends Node2D

var current_cam: Node2D = null

func _ready():
	switch_camera("StageCam")

func switch_camera(cam_name: String):

	# Hide all camera areas (exclude UIElements)
	for child in get_children():
		if child is Node2D and child.name != "UIElements":
			child.visible = false

	# Show selected one
	var cam = get_node_or_null(cam_name)
	if cam:
		cam.visible = true
		current_cam = cam
