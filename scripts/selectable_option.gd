
class_name SelectableOption
extends Node

signal selected

@export var focused: bool = false

func _process(delta: float) -> void:
	if not focused:
		return
	
	pass
