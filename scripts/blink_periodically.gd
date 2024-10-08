extends DoPeriodically

func _ready() -> void:
	action = func() -> void: visible = !visible
