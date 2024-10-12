class_name Navigator
extends Node

@export var next_scene: PackedScene
@export var previous_scene: PackedScene

@onready var title_scene: PackedScene = load("res://scenes/title_screen.tscn")
@onready var file_selection_scene: PackedScene = load("res://scenes/file_selection_screen.tscn")
@onready var game_scene: PackedScene = load("res://scenes/game_scene.tscn")
@onready var file_erase_scene: PackedScene = load("res://scenes/file_erase_screen.tscn")
@onready var file_copy_scene: PackedScene = load("res://scenes/file_copy_screen.tscn")

func skip_to_scene(scene: PackedScene) -> void:
	if scene == null:
		return
	
	get_tree().change_scene_to_packed(scene)

func transition_to_scene(scene: PackedScene) -> void:
	if scene == null:
		return
	
	TransitionScene.transition_finished.connect(
		func(): get_tree().change_scene_to_packed(scene),
		CONNECT_ONE_SHOT
	)
	TransitionScene.transition()

func go_to_next_scene(transition: bool = true) -> void:
	if transition:
		transition_to_scene(next_scene)
	else:
		skip_to_scene(next_scene)

func go_to_previous_scene(transition: bool = true) -> void:
	if transition:
		transition_to_scene(previous_scene)
	else:
		skip_to_scene(previous_scene)

func go_to_title_scene(transition: bool = true) -> void:
	if transition:
		transition_to_scene(title_scene)
	else:
		skip_to_scene(title_scene)

func go_to_file_selection_scene(transition: bool = true) -> void:
	if transition:
		transition_to_scene(file_selection_scene)
	else:
		skip_to_scene(file_selection_scene)

func go_to_game_scene(transition: bool = true) -> void:
	if transition:
		transition_to_scene(game_scene)
	else:
		skip_to_scene(game_scene)

func go_to_file_erase_scene(transition: bool = true) -> void:
	if transition:
		transition_to_scene(file_erase_scene)
	else:
		skip_to_scene(file_erase_scene)

func go_to_file_copy_scene(transition: bool = true) -> void:
	if transition:
		transition_to_scene(file_copy_scene)
	else:
		skip_to_scene(file_copy_scene)
