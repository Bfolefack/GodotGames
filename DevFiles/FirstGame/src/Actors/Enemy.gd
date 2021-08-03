extends Actor

func _ready():
	_velocity.x = -speed.x

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	print(is_on_wall())
	if is_on_wall():
		_velocity.x *= -1;
	if _velocity.x < -speed.x and _velocity.x > speed.x:
		_velocity.x = speed.x;
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	print(is_on_wall())
		
