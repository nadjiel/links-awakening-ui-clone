extends PanelContainer

@onready var file_selection_screen = load("res://scenes/file_selection_screen.tscn")

func go_to_next_screen() -> void:
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(file_selection_screen),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		go_to_next_screen()
