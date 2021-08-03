extends "Entity.gd"
const Bullet = preload("res://src/Entities/Bullet.tscn")

var facing
var target
var respawn_count = 0;
var blink_count = 0;
var timer = 0
var alive = true;
var lives = 3;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = get_viewport().size/2

func _physics_process(delta: float) -> void:
	if alive:
		facing = self.rotation - PI/2
		target = Vector2(cos(facing), sin(facing))
		
		get_input()
		var collision = move(delta)
		loop()
		if collision:
			alive = false;
			visible = false;
			rotation = 0;
			lives -= 1;
			vel = Vector2.ZERO
		
		
		timer += 1
		vel *= .97
		acc = Vector2.ZERO
	else:
		if lives >= 0:
			respawn_count += 1;
			blink_count += 1
			if blink_count > 15:
				blink_count = 0;
				visible = !visible
			if respawn_count == 15:
				position = get_viewport().size/2
			if respawn_count == 75:
				respawn_count = 0;
				blink_count = 0;
				visible = true
				alive = true
		


	
func get_input() -> void:
	if Input.is_action_pressed("Left"):
		rotation -= PI/30 * Input.get_action_strength("Left")
	if Input.is_action_pressed("Right"):
		rotation += PI/30 * Input.get_action_strength("Right")
	if Input.is_action_pressed("Thrust"):
		self.get_child(2).emitting = true;
		get_acceleration()
	else:
		self.get_child(2).emitting = false;
	if Input.is_action_pressed("Fire"):
		if timer >  5:
			fire()

func fire() -> void:
	var bullet = Bullet.instance()
	bullet.set_acc(target, position)
	get_tree().get_root().get_child(0).add_child(bullet)
	timer = 0;

func get_acceleration() -> void:
	acc = Vector2(target.x, target.y)
	acc = acc.normalized()
	acc *= max_speed/4
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("Exit"):
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
