extends Node

const Pipes = preload("res://src/Entities/Pipes.tscn")
var count = 0




func _physics_process(delta: float) -> void:
	count += 1;
	if count > 100:
		count = 0
		var p = Pipes.instance()
		self.add_child(p)
		#get_tree().get_root().add_child(childe)
