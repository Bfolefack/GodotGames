extends Label


var score

func _ready() -> void:
	score = 0


func _process(delta: float) -> void:
	text = "Score:" + String(score)
	if get_tree().get_root().get_child(0).get_node("Game").get_node("Player").lives < 0:
		visible = false 
