extends Node2D

@onready var title_screen: PackedScene = load("res://scenes/title_screen.tscn")

func go_to_title_screen() -> void:
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(title_screen),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()
