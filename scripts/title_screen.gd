extends PanelContainer

const FILE_SELECTION_SCREEN: PackedScene = preload("res://scenes/file_selection_screen.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		TransitionScene.transition_finished.connect(
			go_to_next_screen,
			CONNECT_ONE_SHOT
		)
		TransitionScene.transition()

func go_to_next_screen() -> void:
	get_tree().change_scene_to_packed(FILE_SELECTION_SCREEN)
