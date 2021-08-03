extends Button


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"






func _pressed() -> void:
	get_tree().reload_current_scene()
