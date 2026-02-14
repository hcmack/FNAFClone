extends Area2D

@export var next_scene: PackedScene
@export var hover_time: float = 3.0

var hovering := false
var timer := 0.0

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _process(delta):
	if hovering:
		timer += delta
		if timer >= hover_time:
			get_tree().change_scene_to_packed(next_scene)

func _on_mouse_entered():
	hovering = true
	timer = 0.0

func _on_mouse_exited():
	hovering = false
	timer = 0.0
