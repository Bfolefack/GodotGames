extends KinematicBody2D


export var gravity = 5500
export var jumpHeight = 2000
var dead = false
var collision
var velocity = Vector2.ZERO
var score = 0;


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") && !dead:
		velocity.y += -jumpHeight;
	collision = move_and_collide(velocity * delta)
	if (collision or position.y > 615 or position.y < -80) and !dead:
		velocity.y += -4000
		print("YOU LOSE")
		dead = true
		self.set_collision_layer(2)
		print(self.get_collision_layer())
		self.set_collision_mask(2)
		print(self.get_collision_layer())
	if position.y > 700:
		var Menu = get_tree().get_root().get_child(0).get_node("UI").get_node("Menu")
		Menu.visible = true
		Menu.get_node("Score").text = "Score: " + String(score)
		var Main = get_tree().get_root().get_child(0)
		var highscore = Main.read_savegame()
		if highscore < score:
			Main.save(score)
			highscore = score
		Menu.get_node("Highscore").text = "Highscore: " + String(highscore)
		
	velocity *= .8
	#velocity = Vector2.ZERO;
