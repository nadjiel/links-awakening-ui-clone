
class_name VOptionGroup
extends OptionGroup

func _process(delta: float) -> void:
	super._process(delta)
	
	if not focused:
		return
	
	if Input.is_action_just_pressed("down"):
		select_next()
	if Input.is_action_just_pressed("up"):
		select_previous()
