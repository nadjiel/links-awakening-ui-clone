
extends CanvasLayer

signal transition_finished

func _ready() -> void:
	visible = false

func transition() -> void:
	visible = true
	await get_tree().create_timer(0.25).timeout
	visible = false
	
	transition_finished.emit()
