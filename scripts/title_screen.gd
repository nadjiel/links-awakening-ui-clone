extends Navigator

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter"):
		go_to_next_scene()
