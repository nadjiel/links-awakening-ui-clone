
class_name SelectableOption
extends NavigatableUI

signal selection_changed(new_value: bool)
signal was_selected
signal was_unselected
signal chosen

@export var selected: bool = false:
	set = set_selected

func set_selected(new_value: bool) -> void:
	var old_value: bool = selected
	
	selected = new_value
	
	if old_value != new_value:
		selection_changed.emit(new_value)
		
		if new_value == true:
			was_selected.emit()
		else:
			was_unselected.emit()

func select() -> void:
	selected = true

func unselect() -> void:
	selected = false

func choose() -> void:
	chosen.emit()
