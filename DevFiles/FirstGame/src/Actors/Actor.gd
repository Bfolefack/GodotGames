extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL = Vector2(0.0, -1.0)
var onFloor = false

export var speed:  = Vector2(300.0, 3000.0)
export var gravity = 300.0


var _velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	move_and_slide(_velocity, FLOOR_NORMAL)
