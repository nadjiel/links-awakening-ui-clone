
class_name SelectableOption
extends Node

signal selected
signal unselected
signal chosen

@export var focused: bool = false

func select() -> void:
	selected.emit()

func unselect() -> void:
	unselected.emit()

func choose() -> void:
	chosen.emit()
