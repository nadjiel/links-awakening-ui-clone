
class_name OptionGroup
extends Node

@export var focused: bool = false:
	set = set_focused

@export var options: Array[SelectableOption] = []

@export var initial_option: int = -1

var curr_option: int = initial_option:
	set = set_curr_option

func set_focused(new_value: bool) -> void:
	focused = new_value

func set_curr_option(new_id: int) -> void:
	var prev_option: int = curr_option
	
	curr_option = new_id
	
	if prev_option == new_id:
		return
	if prev_option != -1:
		options[prev_option].unselect()
	
	options[new_id].select()

func select(id: int) -> void:
	if id < 0 or id >= options.size():
		return
	
	curr_option = id

func select_next() -> void:
	if curr_option == -1:
		return select(0)
	if curr_option == options.size() - 1:
		return select(0)
	
	return select(curr_option + 1)

func select_previous() -> void:
	if curr_option == -1:
		return select(options.size() - 1)
	if curr_option == 0:
		return select(options.size() - 1)
	
	return select(curr_option - 1)

func _process(_delta: float) -> void:
	if not focused:
		return
	
	if Input.is_action_just_pressed("enter"):
		options[curr_option].choose()
