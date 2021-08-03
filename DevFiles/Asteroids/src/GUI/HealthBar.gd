extends Sprite

const s0 = preload("res://Assets/livesBar0.png")
const s1 = preload("res://Assets/livesBar1.png")
const s2 = preload("res://Assets/livesBar2.png")
const s3 = preload("res://Assets/livesBar3.png")

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var l = get_tree().get_root().get_child(0).get_node("Game").get_node("Player").lives
	if l == 3:
		set_texture(s3);
	elif l == 2:
		set_texture(s2);
	elif l == 1:
		set_texture(s1);
	else:
		set_texture(s0);
	
