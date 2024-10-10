extends PanelContainer

@onready var game_scene: PackedScene = load("res://scenes/game_scene.tscn")
@onready var file_erase_screen = load("res://scenes/file_erase_screen.tscn")
@onready var file_copy_screen = load("res://scenes/file_copy_screen.tscn")

func go_to_game_screen() -> void:
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(game_scene),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()

func go_to_erase_screen() -> void:
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(file_erase_screen),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()

func go_to_copy_screen() -> void:
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(file_copy_screen),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()
