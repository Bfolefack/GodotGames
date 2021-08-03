extends "res://src/Entities/Mobs/Mob.gd"

export var player_num = 0;
export var thrust_pwr = 10;
var thrusting = false;
var bullet: KinematicBody2D;



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move(delta)
	get_input()
	
func _process(delta):
	if(thrusting):
		self.get_child(2).emitting = true
	else:
		self.get_child(2).emitting = false
	
func get_input() -> void:
	if Input.is_action_pressed("P" + str(player_num) + "_Left"):
		rotation -= PI/30 * Input.get_action_strength("P" + str(player_num) + "_Left")
	if Input.is_action_pressed("P" + str(player_num) + "_Right"):
		rotation += PI/30 * Input.get_action_strength("P" + str(player_num) + "_Right")
	if Input.is_action_pressed("P" + str(player_num) + "_Thrust"):
		thrusting = true
		get_acceleration()
	else:
		thrusting = false
		
func get_acceleration() -> void:
	acc += Vector2(cos(self.rotation - PI/2), sin(self.rotation - PI/2)) * thrust_pwr * Input.get_action_strength("P" + str(player_num) + "_Thrust");
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
