
class_name OptionGroup
extends Node

signal selection_changed
signal option_chosen

@export var focused: bool = false:
	set = set_focused

@export var options: Array[SelectableOption] = []

@export var initial_option: int = -1:
	set = set_initial_option

@export var previous_option_group: OptionGroup

@export var next_option_group: OptionGroup

var curr_option: int = -1:
	set = set_curr_option

func set_focused(new_value: bool) -> void:
	focused = new_value

func set_initial_option(new_id: int) -> void:
	if not is_node_ready():
		await ready
	if not option_id_is_valid(new_id):
		return
	
	initial_option = new_id

func set_curr_option(new_id: int) -> void:
	if not is_node_ready():
		await ready
	if not option_id_is_valid(new_id):
		return
	
	var prev_option: int = curr_option
	
	curr_option = new_id
	
	if prev_option == new_id:
		return
	
	selection_changed.emit()
	
	if prev_option != -1:
		options[prev_option].unselect()
	if new_id != -1:
		options[new_id].select()

func option_id_is_valid(id: int) -> bool:
	return id >= -1 and id < options.size()

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

func focus_previous() -> void:
	if previous_option_group == null:
		return
	
	focused = false
	previous_option_group.focused = true

func focus_next() -> void:
	if next_option_group == null:
		return
	
	focused = false
	next_option_group.focused = true

func _ready() -> void:
	await ready
	curr_option = initial_option

func _process(_delta: float) -> void:
	if not focused:
		return
	
	if Input.is_action_just_pressed("enter"):
		options[curr_option].choose()
		option_chosen.emit()
