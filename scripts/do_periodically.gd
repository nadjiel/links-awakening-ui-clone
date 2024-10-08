
class_name DoPeriodically
extends CanvasItem

@export var interval: float = 0.0

@export var action: Callable

var timer: float = 0.0

func _process(delta: float) -> void:
	if interval == 0.0:
		return
	
	timer += delta
	
	if timer >= interval:
		action.call()
		timer = 0.0
