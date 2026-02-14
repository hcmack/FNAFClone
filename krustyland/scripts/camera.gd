extends Camera2D

@export var boundary_area: Area2D
@export var follow_speed: float = 5.0

var boundary: Rect2
var locked_y: float

func _ready():
	locked_y = global_position.y
	
	var shape = boundary_area.get_node("CollisionShape2D").shape
	
	if shape is RectangleShape2D:
		var size = shape.size
		var area_pos = boundary_area.global_position
		
		boundary = Rect2(
			area_pos - size / 2.0,
			size
		)

func _process(delta):
	var mouse_world_pos = get_global_mouse_position()
	
	# Only move in X
	var target_x = mouse_world_pos.x
	
	global_position.x = lerp(global_position.x, target_x, follow_speed * delta)
	global_position.y = locked_y
	
	clamp_to_bounds()

func clamp_to_bounds():
	var half_screen = get_viewport_rect().size / 2
	
	global_position.x = clamp(global_position.x,
		boundary.position.x + half_screen.x,
		boundary.end.x - half_screen.x)
