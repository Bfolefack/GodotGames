extends KinematicBody2D


onready var screen_size = get_viewport_rect().size
export var max_speed = 100
var vel = Vector2(0, 0)
var acc = Vector2(0, 0)


func loop() -> void:
	if position.x > screen_size.x:
		position.x = 0
	if position.x < 0:
		position.x = screen_size.x
	if position.y > screen_size.y:
		position.y = 0
	if position.y < 0:
		position.y = screen_size.y
		
func move( delta: float ) -> KinematicCollision2D:
	vel += acc;
	vel.clamped(max_speed)
	return move_and_collide(vel * delta)
