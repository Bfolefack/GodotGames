extends KinematicBody2D
export var vectorMag = 5000
var rays = []

var vel = Vector2(0, 0);
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input():
	if(Input.is_action_pressed("Left")):
		vel.x -= Input.get_action_strength("Left")
	if(Input.is_action_pressed("Right")):
		vel.x += Input.get_action_strength("Right")
	if(Input.is_action_pressed("Up")):
		vel.y -= Input.get_action_strength("Up")
	if(Input.is_action_pressed("Down")):
		vel.y += Input.get_action_strength("Down")

func _physics_process(delta: float) -> void:
	for x in range(360):
		rays.append(cast_ray( Vector2(cos(x * (PI/180)), sin(x * (PI/180))) ))
	get_input()
	vel = vel.clamped(5)
	move_and_collide(vel * 50 * delta, true)
	vel *= .8;
	
func _process(delta: float) -> void:
	update()

func cast_ray(v: Vector2) -> Vector2:
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, position + v * vectorMag, [self], collision_mask)
	if result:
		if position.distance_to(result.position) < vectorMag:
			return (result.position - position) * 2
	return(position + v * vectorMag) - position

func _draw():
	#if Geometry.triangulate_polygon(rays).empty():
	#	print("failed")
	#else:
	#	print("triangulated")
	#	draw_colored_polygon(rays, Color(1,1,1,1))
	rays.clear()


