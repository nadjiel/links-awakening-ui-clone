extends Node2D

const TITLE_SCREEN: PackedScene = preload("res://scenes/title_screen.tscn")

func go_to_title_screen() -> void:
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(TITLE_SCREEN),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()
