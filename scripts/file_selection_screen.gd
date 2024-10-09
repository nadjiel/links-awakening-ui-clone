extends PanelContainer

const GAME_SCENE: PackedScene = preload("res://scenes/game_scene.tscn")

func go_to_game_screen() -> void:
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(GAME_SCENE),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()
