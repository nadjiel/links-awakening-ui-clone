
class_name OptionGroup
extends NavigatableUI

signal selection_changed(new_selection: SelectableOption)
signal not_first_selection_changed()
signal option_chosen(option: SelectableOption)

@export var initial_option_id: int = -1:
	set = set_initial_option_id

var curr_option_id: int = -1:
	set = set_curr_option_id

func focus_curr_option() -> void:
	if not is_option_selected():
		return
	
	get_curr_option().make_focused()

func id_is_valid(id: int) -> bool:
	return id >= -1 and id < children.size()

func is_option_selected() -> bool:
	return curr_option_id != -1

func get_curr_option() -> SelectableOption:
	if not is_option_selected():
		return null
	
	return children[curr_option_id]

func set_initial_option_id(new_id: int) -> void:
	if not is_node_ready():
		await ready
	if not id_is_valid(new_id):
		return
	
	initial_option_id = new_id

func set_curr_option_id(new_id: int) -> void:
	if not is_node_ready():
		await ready
	if not id_is_valid(new_id):
		return
	
	var prev_option_id: int = curr_option_id
	
	curr_option_id = new_id
	
	if prev_option_id == new_id:
		return
	
	var new_selection: SelectableOption = children[new_id]
	
	selection_changed.emit(new_selection)
	
	if prev_option_id != -1:
		children[prev_option_id].unselect()
	if new_id != -1:
		children[new_id].select()

func select(id: int, initial_selection: bool = false) -> void:
	if not id_is_valid(id):
		return
	
	curr_option_id = id
	
	if not initial_selection:
		not_first_selection_changed.emit()

func select_initial_option() -> void:
	select(initial_option_id, true)

func select_next() -> void:
	if curr_option_id == -1:
		return select(0)
	if curr_option_id == children.size() - 1:
		return select(0)
	
	return select(curr_option_id + 1)

func select_previous() -> void:
	if curr_option_id == -1:
		return select(children.size() - 1)
	if curr_option_id == 0:
		return select(children.size() - 1)
	
	return select(curr_option_id - 1)

func _ready() -> void:
	await ready
	select_initial_option()

func _process(_delta: float) -> void:
	if not focus:
		return
	
	if Input.is_action_just_pressed("enter"):
		var curr_option: SelectableOption = get_curr_option()
		
		if curr_option == null:
			return
		
		curr_option.choose()
		option_chosen.emit()
