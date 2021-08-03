extends Label



var hopper

func _ready() -> void:
	hopper = get_tree().get_root().get_child(0).get_node("Game").get_node("Hopper")



func _process(delta: float) -> void:
	hopper = get_tree().get_root().get_child(0).get_node("Game").get_node("Hopper")
	if hopper:
		self.text = (String(hopper.score))
