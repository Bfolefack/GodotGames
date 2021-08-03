extends Label

func _process(delta: float) -> void:
	text = String(get_tree().get_root().get_child(0).get_node("GUI").get_node("Score").score)
