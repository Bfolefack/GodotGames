extends "Entity.gd"
 

var _scale = Vector2(0.0, 0.0)
var my_scale = 0.0
var age = 0
var Asteroid = load("res://src/Entities/Asteroid.tscn")
var screensize = null

func _ready() -> void:
	acc = Vector2(rand_range(-100, 100), rand_range(-100, 100))
	rotation = rand_range(0, 360)
	
	
func ast_scale(newScale: float) -> void:
	my_scale = newScale
	_scale = Vector2(newScale/3.0, newScale/3.0)
	position = get_new_position()
	set_scale(_scale)
	
func ast_scale2(newScale: float, pos: Vector2) -> void:
	my_scale = newScale
	_scale = Vector2(newScale/3.0, newScale/3.0)
	position = Vector2(pos.x + rand_range(-50, 50), pos.y + rand_range(-50, 50))
	set_scale(_scale)
	
func split() -> void:
	if age > 20:
		if my_scale > 1:
			var newAst = Asteroid.instance();
			newAst.ast_scale2(my_scale - 1, position)
			get_parent().add_child(newAst)
			newAst = Asteroid.instance();
			newAst.ast_scale2(my_scale - 1, position)
			get_parent().add_child(newAst)
		queue_free()
	
func _physics_process(delta: float) -> void:

	vel += acc
	vel = vel.clamped(max_speed * (1/(my_scale + .0000001)) * 3)
	var collision = move_and_collide(vel * delta, true)
	if collision:
			var coll = collision.get_collider().name
	if !get_tree().get_root().get_child(0).get_node("Game").get_node("Player").alive:
		queue_free()
	loop()

func get_new_position() -> Vector2:
	if screensize:
		var b = floor(rand_range(1, 5))
		if b == 1:
			return Vector2(-100, rand_range(0, screensize.y))
		elif b == 2:
			return Vector2(screensize.x + 100, rand_range(0, screensize.y))
		elif b ==3:
			return Vector2(rand_range(0, screensize.x), -100)
		else:
			return Vector2(rand_range(0, screensize.x), screensize.y + 100)
	return Vector2(0, 0);
func _process(delta: float) -> void:
	if Input.is_action_pressed("Exit"):
		get_tree().quit()
	age += 1
