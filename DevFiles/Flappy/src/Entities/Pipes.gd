extends KinematicBody2D

export var speed = 200
var scoreGiven = false
var hopper
# Called when the node enters the scene tree for the first time.
	
	
func _enter_tree() -> void:
	position.y = rand_range(168, 432)
	position.x = 1088


func _physics_process(delta: float) -> void:
	hopper = get_tree().get_root().get_child(0).get_node("Game").get_node("Hopper")
	if !hopper.dead:
		position.x -= speed * delta
	if position.x < -64:
		queue_free()
	if hopper:
		if position.x < hopper.position.x and !scoreGiven and !hopper.dead:
			scoreGiven = true
			hopper.score += 1
