extends Control


func _ready() -> void:
	rect_size = Vector2(get_viewport().size.x, get_viewport().size.y)
	rect_position = Vector2(get_viewport().size.x/2.0 - 512, get_viewport().size.y/2.0 - 300)
	visible = false



func _process(delta: float) -> void:
	if get_tree().get_root().get_child(0).get_node("Game").get_node("Player").lives < 0:
		visible = true
