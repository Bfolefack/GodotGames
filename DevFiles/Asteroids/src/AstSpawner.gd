extends Node

const Asteroid = preload("res://src/Entities/Asteroid.tscn")

var count = 800
var countSet0 = false

func _process(delta: float) -> void:
	count += 1
	if get_tree().get_root().get_child(0).get_node("Game").get_node("Player").alive:
		countSet0 = false
		if count > 700:
			var newAst = Asteroid.instance();
			newAst.screensize = get_viewport().size
			newAst.ast_scale(4)
			get_tree().get_root().get_child(0).add_child(newAst)
			count -= 700
	elif get_tree().get_root().get_child(0).get_node("Game").get_node("Player").lives >= 0:
		if !countSet0:
			countSet0 = true;
			count = 0;
		if count == 74:
			var newAst = Asteroid.instance();
			newAst.screensize = get_viewport().size
			newAst.ast_scale(4)
			get_tree().get_root().get_child(0).add_child(newAst)
			count = 0;
