extends KinematicBody2D
export var vectorMag = 500
var rays = []
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	for x in range(360):
		rays.append(cast_ray( Vector2(cos(x * (PI/180)), sin(x * (PI/180))) ))

func _process(delta: float) -> void:
	update()

func cast_ray(v: Vector2) -> Vector2:
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, position + v * vectorMag, [self], collision_mask)
	if result:
		return result.position
	return(position + v * vectorMag)

func _draw():
	#for d in rays:
		#draw_line(Vector2(0, 0), (d - position) * 2, Color(.85, .25, .1))
	rays.clear()
