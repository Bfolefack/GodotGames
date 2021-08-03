extends KinematicBody2D

onready var screen_size = get_viewport_rect().size;
export var max_speed = 100
export var bounciness = 1.0
var acc = Vector2()
var vel = Vector2()
export var startPosition = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move(delta):
	vel = vel.clamped(max_speed)
	vel += acc * delta
	vel *= 0.99
	acc = Vector2.ZERO
	var collision = move_and_collide(vel)
	if(collision):
		print(collision.get_collider())
		if(collision.get_collider().bounciness):
			print(str(self.get_index()) + "," + str(vel))
			vel = bounciness * collision.get_collider().bounciness * (vel.bounce(collision.normal))
			print(str(self.get_index()) + "," + str(vel))
			print(collision.get_collider_velocity() * delta);
			vel += collision.get_collider_velocity() * delta * collision.get_collider().bounciness * bounciness
			print(str(self.get_index()) + "," + str(vel))
			print()
	vel = vel.clamped(max_speed)
