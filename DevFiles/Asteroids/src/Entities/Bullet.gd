extends "res://src/Entities/Entity.gd"

var timer = 0
var get_rekt = false

func _ready() -> void:
	pass

func set_acc(newAcc: Vector2, newPos: Vector2) -> void:
	max_speed = 500
	acc = newAcc
	position = newPos + newAcc.normalized() * 75
	acc = acc.normalized()
	acc *= max_speed

	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(acc * delta * 2)
	if collision:
		if collision.get_collider().age > 20:
			collision.get_collider().split()
			get_tree().get_root().get_child(0).get_node("GUI").get_node("Score").score += 100
		queue_free()
	
	loop()

func loop() -> void:
	if position.x > screen_size.x:
		queue_free()
	if position.x < 0:
		queue_free()
	if position.y > screen_size.y:
		queue_free()
	if position.y < 0:
		queue_free()
		
func _process(delta: float) -> void:
	if Input.is_action_pressed("Exit"):
		get_tree().quit()
